
_seqdec_prio:     file format elf32-i386


Disassembly of section .text:

00000000 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	53                   	push   %ebx
   4:	8b 45 08             	mov    0x8(%ebp),%eax
   7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
   a:	89 c2                	mov    %eax,%edx
   c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  10:	83 c1 01             	add    $0x1,%ecx
  13:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
  17:	83 c2 01             	add    $0x1,%edx
  1a:	84 db                	test   %bl,%bl
  1c:	88 5a ff             	mov    %bl,-0x1(%edx)
  1f:	75 ef                	jne    10 <strcpy+0x10>
    ;
  return os;
}
  21:	5b                   	pop    %ebx
  22:	5d                   	pop    %ebp
  23:	c3                   	ret    
  24:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  2a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000030 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  30:	55                   	push   %ebp
  31:	89 e5                	mov    %esp,%ebp
  33:	53                   	push   %ebx
  34:	8b 55 08             	mov    0x8(%ebp),%edx
  37:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
  3a:	0f b6 02             	movzbl (%edx),%eax
  3d:	0f b6 19             	movzbl (%ecx),%ebx
  40:	84 c0                	test   %al,%al
  42:	75 1c                	jne    60 <strcmp+0x30>
  44:	eb 2a                	jmp    70 <strcmp+0x40>
  46:	8d 76 00             	lea    0x0(%esi),%esi
  49:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    p++, q++;
  50:	83 c2 01             	add    $0x1,%edx
  while(*p && *p == *q)
  53:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
  56:	83 c1 01             	add    $0x1,%ecx
  59:	0f b6 19             	movzbl (%ecx),%ebx
  while(*p && *p == *q)
  5c:	84 c0                	test   %al,%al
  5e:	74 10                	je     70 <strcmp+0x40>
  60:	38 d8                	cmp    %bl,%al
  62:	74 ec                	je     50 <strcmp+0x20>
  return (uchar)*p - (uchar)*q;
  64:	29 d8                	sub    %ebx,%eax
}
  66:	5b                   	pop    %ebx
  67:	5d                   	pop    %ebp
  68:	c3                   	ret    
  69:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  70:	31 c0                	xor    %eax,%eax
  return (uchar)*p - (uchar)*q;
  72:	29 d8                	sub    %ebx,%eax
}
  74:	5b                   	pop    %ebx
  75:	5d                   	pop    %ebp
  76:	c3                   	ret    
  77:	89 f6                	mov    %esi,%esi
  79:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000080 <strlen>:

uint
strlen(const char *s)
{
  80:	55                   	push   %ebp
  81:	89 e5                	mov    %esp,%ebp
  83:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
  86:	80 39 00             	cmpb   $0x0,(%ecx)
  89:	74 15                	je     a0 <strlen+0x20>
  8b:	31 d2                	xor    %edx,%edx
  8d:	8d 76 00             	lea    0x0(%esi),%esi
  90:	83 c2 01             	add    $0x1,%edx
  93:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
  97:	89 d0                	mov    %edx,%eax
  99:	75 f5                	jne    90 <strlen+0x10>
    ;
  return n;
}
  9b:	5d                   	pop    %ebp
  9c:	c3                   	ret    
  9d:	8d 76 00             	lea    0x0(%esi),%esi
  for(n = 0; s[n]; n++)
  a0:	31 c0                	xor    %eax,%eax
}
  a2:	5d                   	pop    %ebp
  a3:	c3                   	ret    
  a4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  aa:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000000b0 <memset>:

void*
memset(void *dst, int c, uint n)
{
  b0:	55                   	push   %ebp
  b1:	89 e5                	mov    %esp,%ebp
  b3:	57                   	push   %edi
  b4:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
  b7:	8b 4d 10             	mov    0x10(%ebp),%ecx
  ba:	8b 45 0c             	mov    0xc(%ebp),%eax
  bd:	89 d7                	mov    %edx,%edi
  bf:	fc                   	cld    
  c0:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
  c2:	89 d0                	mov    %edx,%eax
  c4:	5f                   	pop    %edi
  c5:	5d                   	pop    %ebp
  c6:	c3                   	ret    
  c7:	89 f6                	mov    %esi,%esi
  c9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000000d0 <strchr>:

char*
strchr(const char *s, char c)
{
  d0:	55                   	push   %ebp
  d1:	89 e5                	mov    %esp,%ebp
  d3:	53                   	push   %ebx
  d4:	8b 45 08             	mov    0x8(%ebp),%eax
  d7:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  for(; *s; s++)
  da:	0f b6 10             	movzbl (%eax),%edx
  dd:	84 d2                	test   %dl,%dl
  df:	74 1d                	je     fe <strchr+0x2e>
    if(*s == c)
  e1:	38 d3                	cmp    %dl,%bl
  e3:	89 d9                	mov    %ebx,%ecx
  e5:	75 0d                	jne    f4 <strchr+0x24>
  e7:	eb 17                	jmp    100 <strchr+0x30>
  e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  f0:	38 ca                	cmp    %cl,%dl
  f2:	74 0c                	je     100 <strchr+0x30>
  for(; *s; s++)
  f4:	83 c0 01             	add    $0x1,%eax
  f7:	0f b6 10             	movzbl (%eax),%edx
  fa:	84 d2                	test   %dl,%dl
  fc:	75 f2                	jne    f0 <strchr+0x20>
      return (char*)s;
  return 0;
  fe:	31 c0                	xor    %eax,%eax
}
 100:	5b                   	pop    %ebx
 101:	5d                   	pop    %ebp
 102:	c3                   	ret    
 103:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 109:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000110 <gets>:

char*
gets(char *buf, int max)
{
 110:	55                   	push   %ebp
 111:	89 e5                	mov    %esp,%ebp
 113:	57                   	push   %edi
 114:	56                   	push   %esi
 115:	53                   	push   %ebx
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 116:	31 f6                	xor    %esi,%esi
 118:	89 f3                	mov    %esi,%ebx
{
 11a:	83 ec 1c             	sub    $0x1c,%esp
 11d:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i=0; i+1 < max; ){
 120:	eb 2f                	jmp    151 <gets+0x41>
 122:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    cc = read(0, &c, 1);
 128:	8d 45 e7             	lea    -0x19(%ebp),%eax
 12b:	83 ec 04             	sub    $0x4,%esp
 12e:	6a 01                	push   $0x1
 130:	50                   	push   %eax
 131:	6a 00                	push   $0x0
 133:	e8 32 01 00 00       	call   26a <read>
    if(cc < 1)
 138:	83 c4 10             	add    $0x10,%esp
 13b:	85 c0                	test   %eax,%eax
 13d:	7e 1c                	jle    15b <gets+0x4b>
      break;
    buf[i++] = c;
 13f:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 143:	83 c7 01             	add    $0x1,%edi
 146:	88 47 ff             	mov    %al,-0x1(%edi)
    if(c == '\n' || c == '\r')
 149:	3c 0a                	cmp    $0xa,%al
 14b:	74 23                	je     170 <gets+0x60>
 14d:	3c 0d                	cmp    $0xd,%al
 14f:	74 1f                	je     170 <gets+0x60>
  for(i=0; i+1 < max; ){
 151:	83 c3 01             	add    $0x1,%ebx
 154:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 157:	89 fe                	mov    %edi,%esi
 159:	7c cd                	jl     128 <gets+0x18>
 15b:	89 f3                	mov    %esi,%ebx
      break;
  }
  buf[i] = '\0';
  return buf;
}
 15d:	8b 45 08             	mov    0x8(%ebp),%eax
  buf[i] = '\0';
 160:	c6 03 00             	movb   $0x0,(%ebx)
}
 163:	8d 65 f4             	lea    -0xc(%ebp),%esp
 166:	5b                   	pop    %ebx
 167:	5e                   	pop    %esi
 168:	5f                   	pop    %edi
 169:	5d                   	pop    %ebp
 16a:	c3                   	ret    
 16b:	90                   	nop
 16c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 170:	8b 75 08             	mov    0x8(%ebp),%esi
 173:	8b 45 08             	mov    0x8(%ebp),%eax
 176:	01 de                	add    %ebx,%esi
 178:	89 f3                	mov    %esi,%ebx
  buf[i] = '\0';
 17a:	c6 03 00             	movb   $0x0,(%ebx)
}
 17d:	8d 65 f4             	lea    -0xc(%ebp),%esp
 180:	5b                   	pop    %ebx
 181:	5e                   	pop    %esi
 182:	5f                   	pop    %edi
 183:	5d                   	pop    %ebp
 184:	c3                   	ret    
 185:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 189:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000190 <stat>:

int
stat(const char *n, struct stat *st)
{
 190:	55                   	push   %ebp
 191:	89 e5                	mov    %esp,%ebp
 193:	56                   	push   %esi
 194:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 195:	83 ec 08             	sub    $0x8,%esp
 198:	6a 00                	push   $0x0
 19a:	ff 75 08             	pushl  0x8(%ebp)
 19d:	e8 f0 00 00 00       	call   292 <open>
  if(fd < 0)
 1a2:	83 c4 10             	add    $0x10,%esp
 1a5:	85 c0                	test   %eax,%eax
 1a7:	78 27                	js     1d0 <stat+0x40>
    return -1;
  r = fstat(fd, st);
 1a9:	83 ec 08             	sub    $0x8,%esp
 1ac:	ff 75 0c             	pushl  0xc(%ebp)
 1af:	89 c3                	mov    %eax,%ebx
 1b1:	50                   	push   %eax
 1b2:	e8 f3 00 00 00       	call   2aa <fstat>
  close(fd);
 1b7:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
 1ba:	89 c6                	mov    %eax,%esi
  close(fd);
 1bc:	e8 b9 00 00 00       	call   27a <close>
  return r;
 1c1:	83 c4 10             	add    $0x10,%esp
}
 1c4:	8d 65 f8             	lea    -0x8(%ebp),%esp
 1c7:	89 f0                	mov    %esi,%eax
 1c9:	5b                   	pop    %ebx
 1ca:	5e                   	pop    %esi
 1cb:	5d                   	pop    %ebp
 1cc:	c3                   	ret    
 1cd:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
 1d0:	be ff ff ff ff       	mov    $0xffffffff,%esi
 1d5:	eb ed                	jmp    1c4 <stat+0x34>
 1d7:	89 f6                	mov    %esi,%esi
 1d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000001e0 <atoi>:

int
atoi(const char *s)
{
 1e0:	55                   	push   %ebp
 1e1:	89 e5                	mov    %esp,%ebp
 1e3:	53                   	push   %ebx
 1e4:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 1e7:	0f be 11             	movsbl (%ecx),%edx
 1ea:	8d 42 d0             	lea    -0x30(%edx),%eax
 1ed:	3c 09                	cmp    $0x9,%al
  n = 0;
 1ef:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
 1f4:	77 1f                	ja     215 <atoi+0x35>
 1f6:	8d 76 00             	lea    0x0(%esi),%esi
 1f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
    n = n*10 + *s++ - '0';
 200:	8d 04 80             	lea    (%eax,%eax,4),%eax
 203:	83 c1 01             	add    $0x1,%ecx
 206:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  while('0' <= *s && *s <= '9')
 20a:	0f be 11             	movsbl (%ecx),%edx
 20d:	8d 5a d0             	lea    -0x30(%edx),%ebx
 210:	80 fb 09             	cmp    $0x9,%bl
 213:	76 eb                	jbe    200 <atoi+0x20>
  return n;
}
 215:	5b                   	pop    %ebx
 216:	5d                   	pop    %ebp
 217:	c3                   	ret    
 218:	90                   	nop
 219:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000220 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 220:	55                   	push   %ebp
 221:	89 e5                	mov    %esp,%ebp
 223:	56                   	push   %esi
 224:	53                   	push   %ebx
 225:	8b 5d 10             	mov    0x10(%ebp),%ebx
 228:	8b 45 08             	mov    0x8(%ebp),%eax
 22b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 22e:	85 db                	test   %ebx,%ebx
 230:	7e 14                	jle    246 <memmove+0x26>
 232:	31 d2                	xor    %edx,%edx
 234:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
 238:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 23c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 23f:	83 c2 01             	add    $0x1,%edx
  while(n-- > 0)
 242:	39 d3                	cmp    %edx,%ebx
 244:	75 f2                	jne    238 <memmove+0x18>
  return vdst;
}
 246:	5b                   	pop    %ebx
 247:	5e                   	pop    %esi
 248:	5d                   	pop    %ebp
 249:	c3                   	ret    

0000024a <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 24a:	b8 01 00 00 00       	mov    $0x1,%eax
 24f:	cd 40                	int    $0x40
 251:	c3                   	ret    

00000252 <exit>:
SYSCALL(exit)
 252:	b8 02 00 00 00       	mov    $0x2,%eax
 257:	cd 40                	int    $0x40
 259:	c3                   	ret    

0000025a <wait>:
SYSCALL(wait)
 25a:	b8 03 00 00 00       	mov    $0x3,%eax
 25f:	cd 40                	int    $0x40
 261:	c3                   	ret    

00000262 <pipe>:
SYSCALL(pipe)
 262:	b8 04 00 00 00       	mov    $0x4,%eax
 267:	cd 40                	int    $0x40
 269:	c3                   	ret    

0000026a <read>:
SYSCALL(read)
 26a:	b8 05 00 00 00       	mov    $0x5,%eax
 26f:	cd 40                	int    $0x40
 271:	c3                   	ret    

00000272 <write>:
SYSCALL(write)
 272:	b8 10 00 00 00       	mov    $0x10,%eax
 277:	cd 40                	int    $0x40
 279:	c3                   	ret    

0000027a <close>:
SYSCALL(close)
 27a:	b8 15 00 00 00       	mov    $0x15,%eax
 27f:	cd 40                	int    $0x40
 281:	c3                   	ret    

00000282 <kill>:
SYSCALL(kill)
 282:	b8 06 00 00 00       	mov    $0x6,%eax
 287:	cd 40                	int    $0x40
 289:	c3                   	ret    

0000028a <exec>:
SYSCALL(exec)
 28a:	b8 07 00 00 00       	mov    $0x7,%eax
 28f:	cd 40                	int    $0x40
 291:	c3                   	ret    

00000292 <open>:
SYSCALL(open)
 292:	b8 0f 00 00 00       	mov    $0xf,%eax
 297:	cd 40                	int    $0x40
 299:	c3                   	ret    

0000029a <mknod>:
SYSCALL(mknod)
 29a:	b8 11 00 00 00       	mov    $0x11,%eax
 29f:	cd 40                	int    $0x40
 2a1:	c3                   	ret    

000002a2 <unlink>:
SYSCALL(unlink)
 2a2:	b8 12 00 00 00       	mov    $0x12,%eax
 2a7:	cd 40                	int    $0x40
 2a9:	c3                   	ret    

000002aa <fstat>:
SYSCALL(fstat)
 2aa:	b8 08 00 00 00       	mov    $0x8,%eax
 2af:	cd 40                	int    $0x40
 2b1:	c3                   	ret    

000002b2 <link>:
SYSCALL(link)
 2b2:	b8 13 00 00 00       	mov    $0x13,%eax
 2b7:	cd 40                	int    $0x40
 2b9:	c3                   	ret    

000002ba <mkdir>:
SYSCALL(mkdir)
 2ba:	b8 14 00 00 00       	mov    $0x14,%eax
 2bf:	cd 40                	int    $0x40
 2c1:	c3                   	ret    

000002c2 <chdir>:
SYSCALL(chdir)
 2c2:	b8 09 00 00 00       	mov    $0x9,%eax
 2c7:	cd 40                	int    $0x40
 2c9:	c3                   	ret    

000002ca <dup>:
SYSCALL(dup)
 2ca:	b8 0a 00 00 00       	mov    $0xa,%eax
 2cf:	cd 40                	int    $0x40
 2d1:	c3                   	ret    

000002d2 <getpid>:
SYSCALL(getpid)
 2d2:	b8 0b 00 00 00       	mov    $0xb,%eax
 2d7:	cd 40                	int    $0x40
 2d9:	c3                   	ret    

000002da <sbrk>:
SYSCALL(sbrk)
 2da:	b8 0c 00 00 00       	mov    $0xc,%eax
 2df:	cd 40                	int    $0x40
 2e1:	c3                   	ret    

000002e2 <sleep>:
SYSCALL(sleep)
 2e2:	b8 0d 00 00 00       	mov    $0xd,%eax
 2e7:	cd 40                	int    $0x40
 2e9:	c3                   	ret    

000002ea <uptime>:
SYSCALL(uptime)
 2ea:	b8 0e 00 00 00       	mov    $0xe,%eax
 2ef:	cd 40                	int    $0x40
 2f1:	c3                   	ret    

000002f2 <hello>:
SYSCALL(hello) 			// 1-1
 2f2:	b8 16 00 00 00       	mov    $0x16,%eax
 2f7:	cd 40                	int    $0x40
 2f9:	c3                   	ret    

000002fa <hello_name>:
SYSCALL(hello_name) 		// 1-2
 2fa:	b8 17 00 00 00       	mov    $0x17,%eax
 2ff:	cd 40                	int    $0x40
 301:	c3                   	ret    

00000302 <get_num_proc>:
SYSCALL(get_num_proc)		// 1-3
 302:	b8 18 00 00 00       	mov    $0x18,%eax
 307:	cd 40                	int    $0x40
 309:	c3                   	ret    

0000030a <get_max_pid>:
SYSCALL(get_max_pid)		// 1-4
 30a:	b8 19 00 00 00       	mov    $0x19,%eax
 30f:	cd 40                	int    $0x40
 311:	c3                   	ret    

00000312 <get_proc_info>:
 312:	b8 1a 00 00 00       	mov    $0x1a,%eax
 317:	cd 40                	int    $0x40
 319:	c3                   	ret    
 31a:	66 90                	xchg   %ax,%ax
 31c:	66 90                	xchg   %ax,%ax
 31e:	66 90                	xchg   %ax,%ax

00000320 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 320:	55                   	push   %ebp
 321:	89 e5                	mov    %esp,%ebp
 323:	57                   	push   %edi
 324:	56                   	push   %esi
 325:	53                   	push   %ebx
 326:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 329:	85 d2                	test   %edx,%edx
{
 32b:	89 45 c0             	mov    %eax,-0x40(%ebp)
    neg = 1;
    x = -xx;
 32e:	89 d0                	mov    %edx,%eax
  if(sgn && xx < 0){
 330:	79 76                	jns    3a8 <printint+0x88>
 332:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 336:	74 70                	je     3a8 <printint+0x88>
    x = -xx;
 338:	f7 d8                	neg    %eax
    neg = 1;
 33a:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 341:	31 f6                	xor    %esi,%esi
 343:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 346:	eb 0a                	jmp    352 <printint+0x32>
 348:	90                   	nop
 349:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  do{
    buf[i++] = digits[x % base];
 350:	89 fe                	mov    %edi,%esi
 352:	31 d2                	xor    %edx,%edx
 354:	8d 7e 01             	lea    0x1(%esi),%edi
 357:	f7 f1                	div    %ecx
 359:	0f b6 92 20 07 00 00 	movzbl 0x720(%edx),%edx
  }while((x /= base) != 0);
 360:	85 c0                	test   %eax,%eax
    buf[i++] = digits[x % base];
 362:	88 14 3b             	mov    %dl,(%ebx,%edi,1)
  }while((x /= base) != 0);
 365:	75 e9                	jne    350 <printint+0x30>
  if(neg)
 367:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 36a:	85 c0                	test   %eax,%eax
 36c:	74 08                	je     376 <printint+0x56>
    buf[i++] = '-';
 36e:	c6 44 3d d8 2d       	movb   $0x2d,-0x28(%ebp,%edi,1)
 373:	8d 7e 02             	lea    0x2(%esi),%edi
 376:	8d 74 3d d7          	lea    -0x29(%ebp,%edi,1),%esi
 37a:	8b 7d c0             	mov    -0x40(%ebp),%edi
 37d:	8d 76 00             	lea    0x0(%esi),%esi
 380:	0f b6 06             	movzbl (%esi),%eax
  write(fd, &c, 1);
 383:	83 ec 04             	sub    $0x4,%esp
 386:	83 ee 01             	sub    $0x1,%esi
 389:	6a 01                	push   $0x1
 38b:	53                   	push   %ebx
 38c:	57                   	push   %edi
 38d:	88 45 d7             	mov    %al,-0x29(%ebp)
 390:	e8 dd fe ff ff       	call   272 <write>

  while(--i >= 0)
 395:	83 c4 10             	add    $0x10,%esp
 398:	39 de                	cmp    %ebx,%esi
 39a:	75 e4                	jne    380 <printint+0x60>
    putc(fd, buf[i]);
}
 39c:	8d 65 f4             	lea    -0xc(%ebp),%esp
 39f:	5b                   	pop    %ebx
 3a0:	5e                   	pop    %esi
 3a1:	5f                   	pop    %edi
 3a2:	5d                   	pop    %ebp
 3a3:	c3                   	ret    
 3a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 3a8:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 3af:	eb 90                	jmp    341 <printint+0x21>
 3b1:	eb 0d                	jmp    3c0 <printf>
 3b3:	90                   	nop
 3b4:	90                   	nop
 3b5:	90                   	nop
 3b6:	90                   	nop
 3b7:	90                   	nop
 3b8:	90                   	nop
 3b9:	90                   	nop
 3ba:	90                   	nop
 3bb:	90                   	nop
 3bc:	90                   	nop
 3bd:	90                   	nop
 3be:	90                   	nop
 3bf:	90                   	nop

000003c0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 3c0:	55                   	push   %ebp
 3c1:	89 e5                	mov    %esp,%ebp
 3c3:	57                   	push   %edi
 3c4:	56                   	push   %esi
 3c5:	53                   	push   %ebx
 3c6:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 3c9:	8b 75 0c             	mov    0xc(%ebp),%esi
 3cc:	0f b6 1e             	movzbl (%esi),%ebx
 3cf:	84 db                	test   %bl,%bl
 3d1:	0f 84 b3 00 00 00    	je     48a <printf+0xca>
  ap = (uint*)(void*)&fmt + 1;
 3d7:	8d 45 10             	lea    0x10(%ebp),%eax
 3da:	83 c6 01             	add    $0x1,%esi
  state = 0;
 3dd:	31 ff                	xor    %edi,%edi
  ap = (uint*)(void*)&fmt + 1;
 3df:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 3e2:	eb 2f                	jmp    413 <printf+0x53>
 3e4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 3e8:	83 f8 25             	cmp    $0x25,%eax
 3eb:	0f 84 a7 00 00 00    	je     498 <printf+0xd8>
  write(fd, &c, 1);
 3f1:	8d 45 e2             	lea    -0x1e(%ebp),%eax
 3f4:	83 ec 04             	sub    $0x4,%esp
 3f7:	88 5d e2             	mov    %bl,-0x1e(%ebp)
 3fa:	6a 01                	push   $0x1
 3fc:	50                   	push   %eax
 3fd:	ff 75 08             	pushl  0x8(%ebp)
 400:	e8 6d fe ff ff       	call   272 <write>
 405:	83 c4 10             	add    $0x10,%esp
 408:	83 c6 01             	add    $0x1,%esi
  for(i = 0; fmt[i]; i++){
 40b:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
 40f:	84 db                	test   %bl,%bl
 411:	74 77                	je     48a <printf+0xca>
    if(state == 0){
 413:	85 ff                	test   %edi,%edi
    c = fmt[i] & 0xff;
 415:	0f be cb             	movsbl %bl,%ecx
 418:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 41b:	74 cb                	je     3e8 <printf+0x28>
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 41d:	83 ff 25             	cmp    $0x25,%edi
 420:	75 e6                	jne    408 <printf+0x48>
      if(c == 'd'){
 422:	83 f8 64             	cmp    $0x64,%eax
 425:	0f 84 05 01 00 00    	je     530 <printf+0x170>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 42b:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 431:	83 f9 70             	cmp    $0x70,%ecx
 434:	74 72                	je     4a8 <printf+0xe8>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 436:	83 f8 73             	cmp    $0x73,%eax
 439:	0f 84 99 00 00 00    	je     4d8 <printf+0x118>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 43f:	83 f8 63             	cmp    $0x63,%eax
 442:	0f 84 08 01 00 00    	je     550 <printf+0x190>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 448:	83 f8 25             	cmp    $0x25,%eax
 44b:	0f 84 ef 00 00 00    	je     540 <printf+0x180>
  write(fd, &c, 1);
 451:	8d 45 e7             	lea    -0x19(%ebp),%eax
 454:	83 ec 04             	sub    $0x4,%esp
 457:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 45b:	6a 01                	push   $0x1
 45d:	50                   	push   %eax
 45e:	ff 75 08             	pushl  0x8(%ebp)
 461:	e8 0c fe ff ff       	call   272 <write>
 466:	83 c4 0c             	add    $0xc,%esp
 469:	8d 45 e6             	lea    -0x1a(%ebp),%eax
 46c:	88 5d e6             	mov    %bl,-0x1a(%ebp)
 46f:	6a 01                	push   $0x1
 471:	50                   	push   %eax
 472:	ff 75 08             	pushl  0x8(%ebp)
 475:	83 c6 01             	add    $0x1,%esi
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 478:	31 ff                	xor    %edi,%edi
  write(fd, &c, 1);
 47a:	e8 f3 fd ff ff       	call   272 <write>
  for(i = 0; fmt[i]; i++){
 47f:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
  write(fd, &c, 1);
 483:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 486:	84 db                	test   %bl,%bl
 488:	75 89                	jne    413 <printf+0x53>
    }
  }
}
 48a:	8d 65 f4             	lea    -0xc(%ebp),%esp
 48d:	5b                   	pop    %ebx
 48e:	5e                   	pop    %esi
 48f:	5f                   	pop    %edi
 490:	5d                   	pop    %ebp
 491:	c3                   	ret    
 492:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        state = '%';
 498:	bf 25 00 00 00       	mov    $0x25,%edi
 49d:	e9 66 ff ff ff       	jmp    408 <printf+0x48>
 4a2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 4a8:	83 ec 0c             	sub    $0xc,%esp
 4ab:	b9 10 00 00 00       	mov    $0x10,%ecx
 4b0:	6a 00                	push   $0x0
 4b2:	8b 7d d4             	mov    -0x2c(%ebp),%edi
 4b5:	8b 45 08             	mov    0x8(%ebp),%eax
 4b8:	8b 17                	mov    (%edi),%edx
 4ba:	e8 61 fe ff ff       	call   320 <printint>
        ap++;
 4bf:	89 f8                	mov    %edi,%eax
 4c1:	83 c4 10             	add    $0x10,%esp
      state = 0;
 4c4:	31 ff                	xor    %edi,%edi
        ap++;
 4c6:	83 c0 04             	add    $0x4,%eax
 4c9:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 4cc:	e9 37 ff ff ff       	jmp    408 <printf+0x48>
 4d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 4d8:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 4db:	8b 08                	mov    (%eax),%ecx
        ap++;
 4dd:	83 c0 04             	add    $0x4,%eax
 4e0:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        if(s == 0)
 4e3:	85 c9                	test   %ecx,%ecx
 4e5:	0f 84 8e 00 00 00    	je     579 <printf+0x1b9>
        while(*s != 0){
 4eb:	0f b6 01             	movzbl (%ecx),%eax
      state = 0;
 4ee:	31 ff                	xor    %edi,%edi
        s = (char*)*ap;
 4f0:	89 cb                	mov    %ecx,%ebx
        while(*s != 0){
 4f2:	84 c0                	test   %al,%al
 4f4:	0f 84 0e ff ff ff    	je     408 <printf+0x48>
 4fa:	89 75 d0             	mov    %esi,-0x30(%ebp)
 4fd:	89 de                	mov    %ebx,%esi
 4ff:	8b 5d 08             	mov    0x8(%ebp),%ebx
 502:	8d 7d e3             	lea    -0x1d(%ebp),%edi
 505:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 508:	83 ec 04             	sub    $0x4,%esp
          s++;
 50b:	83 c6 01             	add    $0x1,%esi
 50e:	88 45 e3             	mov    %al,-0x1d(%ebp)
  write(fd, &c, 1);
 511:	6a 01                	push   $0x1
 513:	57                   	push   %edi
 514:	53                   	push   %ebx
 515:	e8 58 fd ff ff       	call   272 <write>
        while(*s != 0){
 51a:	0f b6 06             	movzbl (%esi),%eax
 51d:	83 c4 10             	add    $0x10,%esp
 520:	84 c0                	test   %al,%al
 522:	75 e4                	jne    508 <printf+0x148>
 524:	8b 75 d0             	mov    -0x30(%ebp),%esi
      state = 0;
 527:	31 ff                	xor    %edi,%edi
 529:	e9 da fe ff ff       	jmp    408 <printf+0x48>
 52e:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 10, 1);
 530:	83 ec 0c             	sub    $0xc,%esp
 533:	b9 0a 00 00 00       	mov    $0xa,%ecx
 538:	6a 01                	push   $0x1
 53a:	e9 73 ff ff ff       	jmp    4b2 <printf+0xf2>
 53f:	90                   	nop
  write(fd, &c, 1);
 540:	83 ec 04             	sub    $0x4,%esp
 543:	88 5d e5             	mov    %bl,-0x1b(%ebp)
 546:	8d 45 e5             	lea    -0x1b(%ebp),%eax
 549:	6a 01                	push   $0x1
 54b:	e9 21 ff ff ff       	jmp    471 <printf+0xb1>
        putc(fd, *ap);
 550:	8b 7d d4             	mov    -0x2c(%ebp),%edi
  write(fd, &c, 1);
 553:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 556:	8b 07                	mov    (%edi),%eax
  write(fd, &c, 1);
 558:	6a 01                	push   $0x1
        ap++;
 55a:	83 c7 04             	add    $0x4,%edi
        putc(fd, *ap);
 55d:	88 45 e4             	mov    %al,-0x1c(%ebp)
  write(fd, &c, 1);
 560:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 563:	50                   	push   %eax
 564:	ff 75 08             	pushl  0x8(%ebp)
 567:	e8 06 fd ff ff       	call   272 <write>
        ap++;
 56c:	89 7d d4             	mov    %edi,-0x2c(%ebp)
 56f:	83 c4 10             	add    $0x10,%esp
      state = 0;
 572:	31 ff                	xor    %edi,%edi
 574:	e9 8f fe ff ff       	jmp    408 <printf+0x48>
          s = "(null)";
 579:	bb 18 07 00 00       	mov    $0x718,%ebx
        while(*s != 0){
 57e:	b8 28 00 00 00       	mov    $0x28,%eax
 583:	e9 72 ff ff ff       	jmp    4fa <printf+0x13a>
 588:	66 90                	xchg   %ax,%ax
 58a:	66 90                	xchg   %ax,%ax
 58c:	66 90                	xchg   %ax,%ax
 58e:	66 90                	xchg   %ax,%ax

00000590 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 590:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 591:	a1 a0 09 00 00       	mov    0x9a0,%eax
{
 596:	89 e5                	mov    %esp,%ebp
 598:	57                   	push   %edi
 599:	56                   	push   %esi
 59a:	53                   	push   %ebx
 59b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
 59e:	8d 4b f8             	lea    -0x8(%ebx),%ecx
 5a1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 5a8:	39 c8                	cmp    %ecx,%eax
 5aa:	8b 10                	mov    (%eax),%edx
 5ac:	73 32                	jae    5e0 <free+0x50>
 5ae:	39 d1                	cmp    %edx,%ecx
 5b0:	72 04                	jb     5b6 <free+0x26>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 5b2:	39 d0                	cmp    %edx,%eax
 5b4:	72 32                	jb     5e8 <free+0x58>
      break;
  if(bp + bp->s.size == p->s.ptr){
 5b6:	8b 73 fc             	mov    -0x4(%ebx),%esi
 5b9:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 5bc:	39 fa                	cmp    %edi,%edx
 5be:	74 30                	je     5f0 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 5c0:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 5c3:	8b 50 04             	mov    0x4(%eax),%edx
 5c6:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 5c9:	39 f1                	cmp    %esi,%ecx
 5cb:	74 3a                	je     607 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 5cd:	89 08                	mov    %ecx,(%eax)
  freep = p;
 5cf:	a3 a0 09 00 00       	mov    %eax,0x9a0
}
 5d4:	5b                   	pop    %ebx
 5d5:	5e                   	pop    %esi
 5d6:	5f                   	pop    %edi
 5d7:	5d                   	pop    %ebp
 5d8:	c3                   	ret    
 5d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 5e0:	39 d0                	cmp    %edx,%eax
 5e2:	72 04                	jb     5e8 <free+0x58>
 5e4:	39 d1                	cmp    %edx,%ecx
 5e6:	72 ce                	jb     5b6 <free+0x26>
{
 5e8:	89 d0                	mov    %edx,%eax
 5ea:	eb bc                	jmp    5a8 <free+0x18>
 5ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    bp->s.size += p->s.ptr->s.size;
 5f0:	03 72 04             	add    0x4(%edx),%esi
 5f3:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 5f6:	8b 10                	mov    (%eax),%edx
 5f8:	8b 12                	mov    (%edx),%edx
 5fa:	89 53 f8             	mov    %edx,-0x8(%ebx)
  if(p + p->s.size == bp){
 5fd:	8b 50 04             	mov    0x4(%eax),%edx
 600:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 603:	39 f1                	cmp    %esi,%ecx
 605:	75 c6                	jne    5cd <free+0x3d>
    p->s.size += bp->s.size;
 607:	03 53 fc             	add    -0x4(%ebx),%edx
  freep = p;
 60a:	a3 a0 09 00 00       	mov    %eax,0x9a0
    p->s.size += bp->s.size;
 60f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 612:	8b 53 f8             	mov    -0x8(%ebx),%edx
 615:	89 10                	mov    %edx,(%eax)
}
 617:	5b                   	pop    %ebx
 618:	5e                   	pop    %esi
 619:	5f                   	pop    %edi
 61a:	5d                   	pop    %ebp
 61b:	c3                   	ret    
 61c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000620 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 620:	55                   	push   %ebp
 621:	89 e5                	mov    %esp,%ebp
 623:	57                   	push   %edi
 624:	56                   	push   %esi
 625:	53                   	push   %ebx
 626:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 629:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 62c:	8b 15 a0 09 00 00    	mov    0x9a0,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 632:	8d 78 07             	lea    0x7(%eax),%edi
 635:	c1 ef 03             	shr    $0x3,%edi
 638:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
 63b:	85 d2                	test   %edx,%edx
 63d:	0f 84 9d 00 00 00    	je     6e0 <malloc+0xc0>
 643:	8b 02                	mov    (%edx),%eax
 645:	8b 48 04             	mov    0x4(%eax),%ecx
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 648:	39 cf                	cmp    %ecx,%edi
 64a:	76 6c                	jbe    6b8 <malloc+0x98>
 64c:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
 652:	bb 00 10 00 00       	mov    $0x1000,%ebx
 657:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
 65a:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
 661:	eb 0e                	jmp    671 <malloc+0x51>
 663:	90                   	nop
 664:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 668:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 66a:	8b 48 04             	mov    0x4(%eax),%ecx
 66d:	39 f9                	cmp    %edi,%ecx
 66f:	73 47                	jae    6b8 <malloc+0x98>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 671:	39 05 a0 09 00 00    	cmp    %eax,0x9a0
 677:	89 c2                	mov    %eax,%edx
 679:	75 ed                	jne    668 <malloc+0x48>
  p = sbrk(nu * sizeof(Header));
 67b:	83 ec 0c             	sub    $0xc,%esp
 67e:	56                   	push   %esi
 67f:	e8 56 fc ff ff       	call   2da <sbrk>
  if(p == (char*)-1)
 684:	83 c4 10             	add    $0x10,%esp
 687:	83 f8 ff             	cmp    $0xffffffff,%eax
 68a:	74 1c                	je     6a8 <malloc+0x88>
  hp->s.size = nu;
 68c:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
 68f:	83 ec 0c             	sub    $0xc,%esp
 692:	83 c0 08             	add    $0x8,%eax
 695:	50                   	push   %eax
 696:	e8 f5 fe ff ff       	call   590 <free>
  return freep;
 69b:	8b 15 a0 09 00 00    	mov    0x9a0,%edx
      if((p = morecore(nunits)) == 0)
 6a1:	83 c4 10             	add    $0x10,%esp
 6a4:	85 d2                	test   %edx,%edx
 6a6:	75 c0                	jne    668 <malloc+0x48>
        return 0;
  }
}
 6a8:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
 6ab:	31 c0                	xor    %eax,%eax
}
 6ad:	5b                   	pop    %ebx
 6ae:	5e                   	pop    %esi
 6af:	5f                   	pop    %edi
 6b0:	5d                   	pop    %ebp
 6b1:	c3                   	ret    
 6b2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
 6b8:	39 cf                	cmp    %ecx,%edi
 6ba:	74 54                	je     710 <malloc+0xf0>
        p->s.size -= nunits;
 6bc:	29 f9                	sub    %edi,%ecx
 6be:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
 6c1:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
 6c4:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
 6c7:	89 15 a0 09 00 00    	mov    %edx,0x9a0
}
 6cd:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
 6d0:	83 c0 08             	add    $0x8,%eax
}
 6d3:	5b                   	pop    %ebx
 6d4:	5e                   	pop    %esi
 6d5:	5f                   	pop    %edi
 6d6:	5d                   	pop    %ebp
 6d7:	c3                   	ret    
 6d8:	90                   	nop
 6d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    base.s.ptr = freep = prevp = &base;
 6e0:	c7 05 a0 09 00 00 a4 	movl   $0x9a4,0x9a0
 6e7:	09 00 00 
 6ea:	c7 05 a4 09 00 00 a4 	movl   $0x9a4,0x9a4
 6f1:	09 00 00 
    base.s.size = 0;
 6f4:	b8 a4 09 00 00       	mov    $0x9a4,%eax
 6f9:	c7 05 a8 09 00 00 00 	movl   $0x0,0x9a8
 700:	00 00 00 
 703:	e9 44 ff ff ff       	jmp    64c <malloc+0x2c>
 708:	90                   	nop
 709:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        prevp->s.ptr = p->s.ptr;
 710:	8b 08                	mov    (%eax),%ecx
 712:	89 0a                	mov    %ecx,(%edx)
 714:	eb b1                	jmp    6c7 <malloc+0xa7>
