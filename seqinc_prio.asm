
_seqinc_prio:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
            for (j = 0; j < 1024 * 10; j++)
                data[j]++;
    }
}
int main(int argc, char *argv[])
{
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	pushl  -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	57                   	push   %edi
   e:	56                   	push   %esi
   f:	53                   	push   %ebx
  10:	51                   	push   %ecx
  11:	83 ec 18             	sub    $0x18,%esp
    if (argc < 2)
  14:	83 39 01             	cmpl   $0x1,(%ecx)
{
  17:	8b 41 04             	mov    0x4(%ecx),%eax
    if (argc < 2)
  1a:	0f 8e 99 00 00 00    	jle    b9 <main+0xb9>
    {
        printf(1, "test-case <number-of-children>\n");
        exit();
    }
    int N = atoi(argv[1]);
  20:	83 ec 0c             	sub    $0xc,%esp
  23:	ff 70 04             	pushl  0x4(%eax)
  26:	e8 c5 03 00 00       	call   3f0 <atoi>

    int pids[N];
  2b:	8d 1c 85 00 00 00 00 	lea    0x0(,%eax,4),%ebx
    int N = atoi(argv[1]);
  32:	89 c6                	mov    %eax,%esi
    int pids[N];
  34:	83 c4 10             	add    $0x10,%esp
  37:	8d 43 12             	lea    0x12(%ebx),%eax
  3a:	83 e0 f0             	and    $0xfffffff0,%eax
  3d:	29 c4                	sub    %eax,%esp
  3f:	89 65 e4             	mov    %esp,-0x1c(%ebp)
    int rets[N];
  42:	29 c4                	sub    %eax,%esp
  44:	89 65 e0             	mov    %esp,-0x20(%ebp)
    set_prio(1000);
  47:	83 ec 0c             	sub    $0xc,%esp
  4a:	68 e8 03 00 00       	push   $0x3e8
  4f:	e8 e6 04 00 00       	call   53a <set_prio>
    printf(1, "Priority of parent process = %d\n", get_prio());
  54:	e8 d9 04 00 00       	call   532 <get_prio>
  59:	83 c4 0c             	add    $0xc,%esp
  5c:	50                   	push   %eax
  5d:	68 d0 09 00 00       	push   $0x9d0
  62:	6a 01                	push   $0x1
  64:	e8 87 05 00 00       	call   5f0 <printf>

    for (int i = 0; i < N; i++)
  69:	83 c4 10             	add    $0x10,%esp
  6c:	85 f6                	test   %esi,%esi
  6e:	0f 8e fc 00 00 00    	jle    170 <main+0x170>
  74:	31 ff                	xor    %edi,%edi
  76:	eb 17                	jmp    8f <main+0x8f>
  78:	90                   	nop
  79:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
            set_prio(priority);
//            printf(1, "%d\n", get_prio());
            delay(20);
            exit();
        }
        else if (ret > 0)
  80:	7e 4a                	jle    cc <main+0xcc>
        {
            pids[i] = ret;
  82:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  85:	89 04 ba             	mov    %eax,(%edx,%edi,4)
    for (int i = 0; i < N; i++)
  88:	83 c7 01             	add    $0x1,%edi
  8b:	39 fe                	cmp    %edi,%esi
  8d:	74 50                	je     df <main+0xdf>
        int ret = fork();
  8f:	e8 c6 03 00 00       	call   45a <fork>
        if (ret == 0)
  94:	83 f8 00             	cmp    $0x0,%eax
  97:	75 e7                	jne    80 <main+0x80>
        int priority = 10*i + 1 ;
  99:	6b d7 0a             	imul   $0xa,%edi,%edx
            set_prio(priority);
  9c:	83 ec 0c             	sub    $0xc,%esp
        int priority = 10*i + 1 ;
  9f:	83 c2 01             	add    $0x1,%edx
            set_prio(priority);
  a2:	52                   	push   %edx
  a3:	e8 92 04 00 00       	call   53a <set_prio>
            delay(20);
  a8:	c7 04 24 14 00 00 00 	movl   $0x14,(%esp)
  af:	e8 ec 00 00 00       	call   1a0 <delay>
            exit();
  b4:	e8 a9 03 00 00       	call   462 <exit>
        printf(1, "test-case <number-of-children>\n");
  b9:	50                   	push   %eax
  ba:	50                   	push   %eax
  bb:	68 b0 09 00 00       	push   $0x9b0
  c0:	6a 01                	push   $0x1
  c2:	e8 29 05 00 00       	call   5f0 <printf>
        exit();
  c7:	e8 96 03 00 00       	call   462 <exit>
        }
        else
        {
            printf(1, "fork error \n");
  cc:	57                   	push   %edi
  cd:	57                   	push   %edi
  ce:	68 65 09 00 00       	push   $0x965
  d3:	6a 01                	push   $0x1
  d5:	e8 16 05 00 00       	call   5f0 <printf>
            exit();
  da:	e8 83 03 00 00       	call   462 <exit>
  df:	8b 75 e0             	mov    -0x20(%ebp),%esi
  e2:	8d 04 1e             	lea    (%esi,%ebx,1),%eax
    for (int i = 0; i < N; i++)
  e5:	89 f3                	mov    %esi,%ebx
  e7:	89 45 e0             	mov    %eax,-0x20(%ebp)
  ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    }*/

    for (int i = 0; i < N; i++)
    {
//        cps();
        rets[i] = wait();
  f0:	e8 75 03 00 00       	call   46a <wait>
  f5:	83 c3 04             	add    $0x4,%ebx
  f8:	89 43 fc             	mov    %eax,-0x4(%ebx)
    for (int i = 0; i < N; i++)
  fb:	3b 5d e0             	cmp    -0x20(%ebp),%ebx
  fe:	75 f0                	jne    f0 <main+0xf0>
    }

    printf(1, "\nAll children completed\n");
 100:	52                   	push   %edx
 101:	52                   	push   %edx
 102:	68 72 09 00 00       	push   $0x972
 107:	6a 01                	push   $0x1
 109:	e8 e2 04 00 00       	call   5f0 <printf>
 10e:	83 c4 10             	add    $0x10,%esp
 111:	31 c0                	xor    %eax,%eax
 113:	90                   	nop
 114:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    for (int i = 0; i < N; i++)
        printf(1, "Child %d.    pid %d\n", i, pids[i]);
 118:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
 11b:	89 45 e0             	mov    %eax,-0x20(%ebp)
 11e:	ff 34 81             	pushl  (%ecx,%eax,4)
 121:	50                   	push   %eax
 122:	68 99 09 00 00       	push   $0x999
 127:	6a 01                	push   $0x1
 129:	e8 c2 04 00 00       	call   5f0 <printf>
    for (int i = 0; i < N; i++)
 12e:	8b 45 e0             	mov    -0x20(%ebp),%eax
 131:	83 c4 10             	add    $0x10,%esp
 134:	83 c0 01             	add    $0x1,%eax
 137:	39 f8                	cmp    %edi,%eax
 139:	75 dd                	jne    118 <main+0x118>

    printf(1, "\nExit order \n");
 13b:	50                   	push   %eax
 13c:	50                   	push   %eax
 13d:	68 8b 09 00 00       	push   $0x98b
 142:	6a 01                	push   $0x1
 144:	e8 a7 04 00 00       	call   5f0 <printf>
 149:	83 c4 10             	add    $0x10,%esp
 14c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    for (int i = 0; i < N; i++)
        printf(1, "pid %d\n", rets[i]);
 150:	83 ec 04             	sub    $0x4,%esp
 153:	ff 36                	pushl  (%esi)
 155:	83 c6 04             	add    $0x4,%esi
 158:	68 a6 09 00 00       	push   $0x9a6
 15d:	6a 01                	push   $0x1
 15f:	e8 8c 04 00 00       	call   5f0 <printf>
    for (int i = 0; i < N; i++)
 164:	83 c4 10             	add    $0x10,%esp
 167:	39 f3                	cmp    %esi,%ebx
 169:	75 e5                	jne    150 <main+0x150>

    exit();
 16b:	e8 f2 02 00 00       	call   462 <exit>
    printf(1, "\nAll children completed\n");
 170:	51                   	push   %ecx
 171:	51                   	push   %ecx
 172:	68 72 09 00 00       	push   $0x972
 177:	6a 01                	push   $0x1
 179:	e8 72 04 00 00       	call   5f0 <printf>
    printf(1, "\nExit order \n");
 17e:	5b                   	pop    %ebx
 17f:	5e                   	pop    %esi
 180:	68 8b 09 00 00       	push   $0x98b
 185:	6a 01                	push   $0x1
 187:	e8 64 04 00 00       	call   5f0 <printf>
 18c:	83 c4 10             	add    $0x10,%esp
 18f:	eb da                	jmp    16b <main+0x16b>
 191:	66 90                	xchg   %ax,%ax
 193:	66 90                	xchg   %ax,%ax
 195:	66 90                	xchg   %ax,%ax
 197:	66 90                	xchg   %ax,%ax
 199:	66 90                	xchg   %ax,%ax
 19b:	66 90                	xchg   %ax,%ax
 19d:	66 90                	xchg   %ax,%ax
 19f:	90                   	nop

000001a0 <delay>:
{
 1a0:	55                   	push   %ebp
 1a1:	89 e5                	mov    %esp,%ebp
 1a3:	57                   	push   %edi
 1a4:	56                   	push   %esi
 1a5:	53                   	push   %ebx
 1a6:	83 ec 18             	sub    $0x18,%esp
 1a9:	8b 7d 08             	mov    0x8(%ebp),%edi
    data = (int *)malloc(sizeof(int) * 1024 * 10);
 1ac:	68 00 a0 00 00       	push   $0xa000
 1b1:	e8 9a 06 00 00       	call   850 <malloc>
    if (data <= 0)
 1b6:	83 c4 10             	add    $0x10,%esp
 1b9:	85 c0                	test   %eax,%eax
    data = (int *)malloc(sizeof(int) * 1024 * 10);
 1bb:	89 c3                	mov    %eax,%ebx
    if (data <= 0)
 1bd:	75 12                	jne    1d1 <delay+0x31>
        printf(1, "Error on memory allocation \n");
 1bf:	83 ec 08             	sub    $0x8,%esp
 1c2:	68 48 09 00 00       	push   $0x948
 1c7:	6a 01                	push   $0x1
 1c9:	e8 22 04 00 00       	call   5f0 <printf>
 1ce:	83 c4 10             	add    $0x10,%esp
    for (i = 0; i < count; i++)
 1d1:	31 f6                	xor    %esi,%esi
 1d3:	85 ff                	test   %edi,%edi
 1d5:	8d 8b 00 a0 00 00    	lea    0xa000(%ebx),%ecx
 1db:	7e 29                	jle    206 <delay+0x66>
{
 1dd:	b8 44 16 00 00       	mov    $0x1644,%eax
 1e2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 1e8:	89 da                	mov    %ebx,%edx
 1ea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
                data[j]++;
 1f0:	83 02 01             	addl   $0x1,(%edx)
 1f3:	83 c2 04             	add    $0x4,%edx
            for (j = 0; j < 1024 * 10; j++)
 1f6:	39 ca                	cmp    %ecx,%edx
 1f8:	75 f6                	jne    1f0 <delay+0x50>
        for (k = 0; k < 5700; k++)
 1fa:	83 e8 01             	sub    $0x1,%eax
 1fd:	75 e9                	jne    1e8 <delay+0x48>
    for (i = 0; i < count; i++)
 1ff:	83 c6 01             	add    $0x1,%esi
 202:	39 f7                	cmp    %esi,%edi
 204:	75 d7                	jne    1dd <delay+0x3d>
}
 206:	8d 65 f4             	lea    -0xc(%ebp),%esp
 209:	5b                   	pop    %ebx
 20a:	5e                   	pop    %esi
 20b:	5f                   	pop    %edi
 20c:	5d                   	pop    %ebp
 20d:	c3                   	ret    
 20e:	66 90                	xchg   %ax,%ax

00000210 <strcpy>:
 210:	55                   	push   %ebp
 211:	89 e5                	mov    %esp,%ebp
 213:	53                   	push   %ebx
 214:	8b 45 08             	mov    0x8(%ebp),%eax
 217:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 21a:	89 c2                	mov    %eax,%edx
 21c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 220:	83 c1 01             	add    $0x1,%ecx
 223:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
 227:	83 c2 01             	add    $0x1,%edx
 22a:	84 db                	test   %bl,%bl
 22c:	88 5a ff             	mov    %bl,-0x1(%edx)
 22f:	75 ef                	jne    220 <strcpy+0x10>
 231:	5b                   	pop    %ebx
 232:	5d                   	pop    %ebp
 233:	c3                   	ret    
 234:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 23a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000240 <strcmp>:
 240:	55                   	push   %ebp
 241:	89 e5                	mov    %esp,%ebp
 243:	53                   	push   %ebx
 244:	8b 55 08             	mov    0x8(%ebp),%edx
 247:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 24a:	0f b6 02             	movzbl (%edx),%eax
 24d:	0f b6 19             	movzbl (%ecx),%ebx
 250:	84 c0                	test   %al,%al
 252:	75 1c                	jne    270 <strcmp+0x30>
 254:	eb 2a                	jmp    280 <strcmp+0x40>
 256:	8d 76 00             	lea    0x0(%esi),%esi
 259:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
 260:	83 c2 01             	add    $0x1,%edx
 263:	0f b6 02             	movzbl (%edx),%eax
 266:	83 c1 01             	add    $0x1,%ecx
 269:	0f b6 19             	movzbl (%ecx),%ebx
 26c:	84 c0                	test   %al,%al
 26e:	74 10                	je     280 <strcmp+0x40>
 270:	38 d8                	cmp    %bl,%al
 272:	74 ec                	je     260 <strcmp+0x20>
 274:	29 d8                	sub    %ebx,%eax
 276:	5b                   	pop    %ebx
 277:	5d                   	pop    %ebp
 278:	c3                   	ret    
 279:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 280:	31 c0                	xor    %eax,%eax
 282:	29 d8                	sub    %ebx,%eax
 284:	5b                   	pop    %ebx
 285:	5d                   	pop    %ebp
 286:	c3                   	ret    
 287:	89 f6                	mov    %esi,%esi
 289:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000290 <strlen>:
 290:	55                   	push   %ebp
 291:	89 e5                	mov    %esp,%ebp
 293:	8b 4d 08             	mov    0x8(%ebp),%ecx
 296:	80 39 00             	cmpb   $0x0,(%ecx)
 299:	74 15                	je     2b0 <strlen+0x20>
 29b:	31 d2                	xor    %edx,%edx
 29d:	8d 76 00             	lea    0x0(%esi),%esi
 2a0:	83 c2 01             	add    $0x1,%edx
 2a3:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 2a7:	89 d0                	mov    %edx,%eax
 2a9:	75 f5                	jne    2a0 <strlen+0x10>
 2ab:	5d                   	pop    %ebp
 2ac:	c3                   	ret    
 2ad:	8d 76 00             	lea    0x0(%esi),%esi
 2b0:	31 c0                	xor    %eax,%eax
 2b2:	5d                   	pop    %ebp
 2b3:	c3                   	ret    
 2b4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 2ba:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000002c0 <memset>:
 2c0:	55                   	push   %ebp
 2c1:	89 e5                	mov    %esp,%ebp
 2c3:	57                   	push   %edi
 2c4:	8b 55 08             	mov    0x8(%ebp),%edx
 2c7:	8b 4d 10             	mov    0x10(%ebp),%ecx
 2ca:	8b 45 0c             	mov    0xc(%ebp),%eax
 2cd:	89 d7                	mov    %edx,%edi
 2cf:	fc                   	cld    
 2d0:	f3 aa                	rep stos %al,%es:(%edi)
 2d2:	89 d0                	mov    %edx,%eax
 2d4:	5f                   	pop    %edi
 2d5:	5d                   	pop    %ebp
 2d6:	c3                   	ret    
 2d7:	89 f6                	mov    %esi,%esi
 2d9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000002e0 <strchr>:
 2e0:	55                   	push   %ebp
 2e1:	89 e5                	mov    %esp,%ebp
 2e3:	53                   	push   %ebx
 2e4:	8b 45 08             	mov    0x8(%ebp),%eax
 2e7:	8b 5d 0c             	mov    0xc(%ebp),%ebx
 2ea:	0f b6 10             	movzbl (%eax),%edx
 2ed:	84 d2                	test   %dl,%dl
 2ef:	74 1d                	je     30e <strchr+0x2e>
 2f1:	38 d3                	cmp    %dl,%bl
 2f3:	89 d9                	mov    %ebx,%ecx
 2f5:	75 0d                	jne    304 <strchr+0x24>
 2f7:	eb 17                	jmp    310 <strchr+0x30>
 2f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 300:	38 ca                	cmp    %cl,%dl
 302:	74 0c                	je     310 <strchr+0x30>
 304:	83 c0 01             	add    $0x1,%eax
 307:	0f b6 10             	movzbl (%eax),%edx
 30a:	84 d2                	test   %dl,%dl
 30c:	75 f2                	jne    300 <strchr+0x20>
 30e:	31 c0                	xor    %eax,%eax
 310:	5b                   	pop    %ebx
 311:	5d                   	pop    %ebp
 312:	c3                   	ret    
 313:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 319:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000320 <gets>:
 320:	55                   	push   %ebp
 321:	89 e5                	mov    %esp,%ebp
 323:	57                   	push   %edi
 324:	56                   	push   %esi
 325:	53                   	push   %ebx
 326:	31 f6                	xor    %esi,%esi
 328:	89 f3                	mov    %esi,%ebx
 32a:	83 ec 1c             	sub    $0x1c,%esp
 32d:	8b 7d 08             	mov    0x8(%ebp),%edi
 330:	eb 2f                	jmp    361 <gets+0x41>
 332:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 338:	8d 45 e7             	lea    -0x19(%ebp),%eax
 33b:	83 ec 04             	sub    $0x4,%esp
 33e:	6a 01                	push   $0x1
 340:	50                   	push   %eax
 341:	6a 00                	push   $0x0
 343:	e8 32 01 00 00       	call   47a <read>
 348:	83 c4 10             	add    $0x10,%esp
 34b:	85 c0                	test   %eax,%eax
 34d:	7e 1c                	jle    36b <gets+0x4b>
 34f:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
 353:	83 c7 01             	add    $0x1,%edi
 356:	88 47 ff             	mov    %al,-0x1(%edi)
 359:	3c 0a                	cmp    $0xa,%al
 35b:	74 23                	je     380 <gets+0x60>
 35d:	3c 0d                	cmp    $0xd,%al
 35f:	74 1f                	je     380 <gets+0x60>
 361:	83 c3 01             	add    $0x1,%ebx
 364:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 367:	89 fe                	mov    %edi,%esi
 369:	7c cd                	jl     338 <gets+0x18>
 36b:	89 f3                	mov    %esi,%ebx
 36d:	8b 45 08             	mov    0x8(%ebp),%eax
 370:	c6 03 00             	movb   $0x0,(%ebx)
 373:	8d 65 f4             	lea    -0xc(%ebp),%esp
 376:	5b                   	pop    %ebx
 377:	5e                   	pop    %esi
 378:	5f                   	pop    %edi
 379:	5d                   	pop    %ebp
 37a:	c3                   	ret    
 37b:	90                   	nop
 37c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 380:	8b 75 08             	mov    0x8(%ebp),%esi
 383:	8b 45 08             	mov    0x8(%ebp),%eax
 386:	01 de                	add    %ebx,%esi
 388:	89 f3                	mov    %esi,%ebx
 38a:	c6 03 00             	movb   $0x0,(%ebx)
 38d:	8d 65 f4             	lea    -0xc(%ebp),%esp
 390:	5b                   	pop    %ebx
 391:	5e                   	pop    %esi
 392:	5f                   	pop    %edi
 393:	5d                   	pop    %ebp
 394:	c3                   	ret    
 395:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 399:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000003a0 <stat>:
 3a0:	55                   	push   %ebp
 3a1:	89 e5                	mov    %esp,%ebp
 3a3:	56                   	push   %esi
 3a4:	53                   	push   %ebx
 3a5:	83 ec 08             	sub    $0x8,%esp
 3a8:	6a 00                	push   $0x0
 3aa:	ff 75 08             	pushl  0x8(%ebp)
 3ad:	e8 f0 00 00 00       	call   4a2 <open>
 3b2:	83 c4 10             	add    $0x10,%esp
 3b5:	85 c0                	test   %eax,%eax
 3b7:	78 27                	js     3e0 <stat+0x40>
 3b9:	83 ec 08             	sub    $0x8,%esp
 3bc:	ff 75 0c             	pushl  0xc(%ebp)
 3bf:	89 c3                	mov    %eax,%ebx
 3c1:	50                   	push   %eax
 3c2:	e8 f3 00 00 00       	call   4ba <fstat>
 3c7:	89 1c 24             	mov    %ebx,(%esp)
 3ca:	89 c6                	mov    %eax,%esi
 3cc:	e8 b9 00 00 00       	call   48a <close>
 3d1:	83 c4 10             	add    $0x10,%esp
 3d4:	8d 65 f8             	lea    -0x8(%ebp),%esp
 3d7:	89 f0                	mov    %esi,%eax
 3d9:	5b                   	pop    %ebx
 3da:	5e                   	pop    %esi
 3db:	5d                   	pop    %ebp
 3dc:	c3                   	ret    
 3dd:	8d 76 00             	lea    0x0(%esi),%esi
 3e0:	be ff ff ff ff       	mov    $0xffffffff,%esi
 3e5:	eb ed                	jmp    3d4 <stat+0x34>
 3e7:	89 f6                	mov    %esi,%esi
 3e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000003f0 <atoi>:
 3f0:	55                   	push   %ebp
 3f1:	89 e5                	mov    %esp,%ebp
 3f3:	53                   	push   %ebx
 3f4:	8b 4d 08             	mov    0x8(%ebp),%ecx
 3f7:	0f be 11             	movsbl (%ecx),%edx
 3fa:	8d 42 d0             	lea    -0x30(%edx),%eax
 3fd:	3c 09                	cmp    $0x9,%al
 3ff:	b8 00 00 00 00       	mov    $0x0,%eax
 404:	77 1f                	ja     425 <atoi+0x35>
 406:	8d 76 00             	lea    0x0(%esi),%esi
 409:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi
 410:	8d 04 80             	lea    (%eax,%eax,4),%eax
 413:	83 c1 01             	add    $0x1,%ecx
 416:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
 41a:	0f be 11             	movsbl (%ecx),%edx
 41d:	8d 5a d0             	lea    -0x30(%edx),%ebx
 420:	80 fb 09             	cmp    $0x9,%bl
 423:	76 eb                	jbe    410 <atoi+0x20>
 425:	5b                   	pop    %ebx
 426:	5d                   	pop    %ebp
 427:	c3                   	ret    
 428:	90                   	nop
 429:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000430 <memmove>:
 430:	55                   	push   %ebp
 431:	89 e5                	mov    %esp,%ebp
 433:	56                   	push   %esi
 434:	53                   	push   %ebx
 435:	8b 5d 10             	mov    0x10(%ebp),%ebx
 438:	8b 45 08             	mov    0x8(%ebp),%eax
 43b:	8b 75 0c             	mov    0xc(%ebp),%esi
 43e:	85 db                	test   %ebx,%ebx
 440:	7e 14                	jle    456 <memmove+0x26>
 442:	31 d2                	xor    %edx,%edx
 444:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 448:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 44c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 44f:	83 c2 01             	add    $0x1,%edx
 452:	39 d3                	cmp    %edx,%ebx
 454:	75 f2                	jne    448 <memmove+0x18>
 456:	5b                   	pop    %ebx
 457:	5e                   	pop    %esi
 458:	5d                   	pop    %ebp
 459:	c3                   	ret    

0000045a <fork>:
 45a:	b8 01 00 00 00       	mov    $0x1,%eax
 45f:	cd 40                	int    $0x40
 461:	c3                   	ret    

00000462 <exit>:
 462:	b8 02 00 00 00       	mov    $0x2,%eax
 467:	cd 40                	int    $0x40
 469:	c3                   	ret    

0000046a <wait>:
 46a:	b8 03 00 00 00       	mov    $0x3,%eax
 46f:	cd 40                	int    $0x40
 471:	c3                   	ret    

00000472 <pipe>:
 472:	b8 04 00 00 00       	mov    $0x4,%eax
 477:	cd 40                	int    $0x40
 479:	c3                   	ret    

0000047a <read>:
 47a:	b8 05 00 00 00       	mov    $0x5,%eax
 47f:	cd 40                	int    $0x40
 481:	c3                   	ret    

00000482 <write>:
 482:	b8 10 00 00 00       	mov    $0x10,%eax
 487:	cd 40                	int    $0x40
 489:	c3                   	ret    

0000048a <close>:
 48a:	b8 15 00 00 00       	mov    $0x15,%eax
 48f:	cd 40                	int    $0x40
 491:	c3                   	ret    

00000492 <kill>:
 492:	b8 06 00 00 00       	mov    $0x6,%eax
 497:	cd 40                	int    $0x40
 499:	c3                   	ret    

0000049a <exec>:
 49a:	b8 07 00 00 00       	mov    $0x7,%eax
 49f:	cd 40                	int    $0x40
 4a1:	c3                   	ret    

000004a2 <open>:
 4a2:	b8 0f 00 00 00       	mov    $0xf,%eax
 4a7:	cd 40                	int    $0x40
 4a9:	c3                   	ret    

000004aa <mknod>:
 4aa:	b8 11 00 00 00       	mov    $0x11,%eax
 4af:	cd 40                	int    $0x40
 4b1:	c3                   	ret    

000004b2 <unlink>:
 4b2:	b8 12 00 00 00       	mov    $0x12,%eax
 4b7:	cd 40                	int    $0x40
 4b9:	c3                   	ret    

000004ba <fstat>:
 4ba:	b8 08 00 00 00       	mov    $0x8,%eax
 4bf:	cd 40                	int    $0x40
 4c1:	c3                   	ret    

000004c2 <link>:
 4c2:	b8 13 00 00 00       	mov    $0x13,%eax
 4c7:	cd 40                	int    $0x40
 4c9:	c3                   	ret    

000004ca <mkdir>:
 4ca:	b8 14 00 00 00       	mov    $0x14,%eax
 4cf:	cd 40                	int    $0x40
 4d1:	c3                   	ret    

000004d2 <chdir>:
 4d2:	b8 09 00 00 00       	mov    $0x9,%eax
 4d7:	cd 40                	int    $0x40
 4d9:	c3                   	ret    

000004da <dup>:
 4da:	b8 0a 00 00 00       	mov    $0xa,%eax
 4df:	cd 40                	int    $0x40
 4e1:	c3                   	ret    

000004e2 <getpid>:
 4e2:	b8 0b 00 00 00       	mov    $0xb,%eax
 4e7:	cd 40                	int    $0x40
 4e9:	c3                   	ret    

000004ea <sbrk>:
 4ea:	b8 0c 00 00 00       	mov    $0xc,%eax
 4ef:	cd 40                	int    $0x40
 4f1:	c3                   	ret    

000004f2 <sleep>:
 4f2:	b8 0d 00 00 00       	mov    $0xd,%eax
 4f7:	cd 40                	int    $0x40
 4f9:	c3                   	ret    

000004fa <uptime>:
 4fa:	b8 0e 00 00 00       	mov    $0xe,%eax
 4ff:	cd 40                	int    $0x40
 501:	c3                   	ret    

00000502 <hello>:
 502:	b8 16 00 00 00       	mov    $0x16,%eax
 507:	cd 40                	int    $0x40
 509:	c3                   	ret    

0000050a <hello_name>:
 50a:	b8 17 00 00 00       	mov    $0x17,%eax
 50f:	cd 40                	int    $0x40
 511:	c3                   	ret    

00000512 <get_num_proc>:
 512:	b8 18 00 00 00       	mov    $0x18,%eax
 517:	cd 40                	int    $0x40
 519:	c3                   	ret    

0000051a <get_max_pid>:
 51a:	b8 19 00 00 00       	mov    $0x19,%eax
 51f:	cd 40                	int    $0x40
 521:	c3                   	ret    

00000522 <get_proc_info>:
 522:	b8 1a 00 00 00       	mov    $0x1a,%eax
 527:	cd 40                	int    $0x40
 529:	c3                   	ret    

0000052a <cps>:
 52a:	b8 1b 00 00 00       	mov    $0x1b,%eax
 52f:	cd 40                	int    $0x40
 531:	c3                   	ret    

00000532 <get_prio>:
 532:	b8 1c 00 00 00       	mov    $0x1c,%eax
 537:	cd 40                	int    $0x40
 539:	c3                   	ret    

0000053a <set_prio>:
 53a:	b8 1d 00 00 00       	mov    $0x1d,%eax
 53f:	cd 40                	int    $0x40
 541:	c3                   	ret    
 542:	66 90                	xchg   %ax,%ax
 544:	66 90                	xchg   %ax,%ax
 546:	66 90                	xchg   %ax,%ax
 548:	66 90                	xchg   %ax,%ax
 54a:	66 90                	xchg   %ax,%ax
 54c:	66 90                	xchg   %ax,%ax
 54e:	66 90                	xchg   %ax,%ax

00000550 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 550:	55                   	push   %ebp
 551:	89 e5                	mov    %esp,%ebp
 553:	57                   	push   %edi
 554:	56                   	push   %esi
 555:	53                   	push   %ebx
 556:	83 ec 3c             	sub    $0x3c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 559:	85 d2                	test   %edx,%edx
{
 55b:	89 45 c0             	mov    %eax,-0x40(%ebp)
    neg = 1;
    x = -xx;
 55e:	89 d0                	mov    %edx,%eax
  if(sgn && xx < 0){
 560:	79 76                	jns    5d8 <printint+0x88>
 562:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
 566:	74 70                	je     5d8 <printint+0x88>
    x = -xx;
 568:	f7 d8                	neg    %eax
    neg = 1;
 56a:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
  } else {
    x = xx;
  }

  i = 0;
 571:	31 f6                	xor    %esi,%esi
 573:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 576:	eb 0a                	jmp    582 <printint+0x32>
 578:	90                   	nop
 579:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  do{
    buf[i++] = digits[x % base];
 580:	89 fe                	mov    %edi,%esi
 582:	31 d2                	xor    %edx,%edx
 584:	8d 7e 01             	lea    0x1(%esi),%edi
 587:	f7 f1                	div    %ecx
 589:	0f b6 92 fc 09 00 00 	movzbl 0x9fc(%edx),%edx
  }while((x /= base) != 0);
 590:	85 c0                	test   %eax,%eax
    buf[i++] = digits[x % base];
 592:	88 14 3b             	mov    %dl,(%ebx,%edi,1)
  }while((x /= base) != 0);
 595:	75 e9                	jne    580 <printint+0x30>
  if(neg)
 597:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 59a:	85 c0                	test   %eax,%eax
 59c:	74 08                	je     5a6 <printint+0x56>
    buf[i++] = '-';
 59e:	c6 44 3d d8 2d       	movb   $0x2d,-0x28(%ebp,%edi,1)
 5a3:	8d 7e 02             	lea    0x2(%esi),%edi
 5a6:	8d 74 3d d7          	lea    -0x29(%ebp,%edi,1),%esi
 5aa:	8b 7d c0             	mov    -0x40(%ebp),%edi
 5ad:	8d 76 00             	lea    0x0(%esi),%esi
 5b0:	0f b6 06             	movzbl (%esi),%eax
  write(fd, &c, 1);
 5b3:	83 ec 04             	sub    $0x4,%esp
 5b6:	83 ee 01             	sub    $0x1,%esi
 5b9:	6a 01                	push   $0x1
 5bb:	53                   	push   %ebx
 5bc:	57                   	push   %edi
 5bd:	88 45 d7             	mov    %al,-0x29(%ebp)
 5c0:	e8 bd fe ff ff       	call   482 <write>

  while(--i >= 0)
 5c5:	83 c4 10             	add    $0x10,%esp
 5c8:	39 de                	cmp    %ebx,%esi
 5ca:	75 e4                	jne    5b0 <printint+0x60>
    putc(fd, buf[i]);
}
 5cc:	8d 65 f4             	lea    -0xc(%ebp),%esp
 5cf:	5b                   	pop    %ebx
 5d0:	5e                   	pop    %esi
 5d1:	5f                   	pop    %edi
 5d2:	5d                   	pop    %ebp
 5d3:	c3                   	ret    
 5d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
 5d8:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 5df:	eb 90                	jmp    571 <printint+0x21>
 5e1:	eb 0d                	jmp    5f0 <printf>
 5e3:	90                   	nop
 5e4:	90                   	nop
 5e5:	90                   	nop
 5e6:	90                   	nop
 5e7:	90                   	nop
 5e8:	90                   	nop
 5e9:	90                   	nop
 5ea:	90                   	nop
 5eb:	90                   	nop
 5ec:	90                   	nop
 5ed:	90                   	nop
 5ee:	90                   	nop
 5ef:	90                   	nop

000005f0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 5f0:	55                   	push   %ebp
 5f1:	89 e5                	mov    %esp,%ebp
 5f3:	57                   	push   %edi
 5f4:	56                   	push   %esi
 5f5:	53                   	push   %ebx
 5f6:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 5f9:	8b 75 0c             	mov    0xc(%ebp),%esi
 5fc:	0f b6 1e             	movzbl (%esi),%ebx
 5ff:	84 db                	test   %bl,%bl
 601:	0f 84 b3 00 00 00    	je     6ba <printf+0xca>
  ap = (uint*)(void*)&fmt + 1;
 607:	8d 45 10             	lea    0x10(%ebp),%eax
 60a:	83 c6 01             	add    $0x1,%esi
  state = 0;
 60d:	31 ff                	xor    %edi,%edi
  ap = (uint*)(void*)&fmt + 1;
 60f:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 612:	eb 2f                	jmp    643 <printf+0x53>
 614:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 618:	83 f8 25             	cmp    $0x25,%eax
 61b:	0f 84 a7 00 00 00    	je     6c8 <printf+0xd8>
  write(fd, &c, 1);
 621:	8d 45 e2             	lea    -0x1e(%ebp),%eax
 624:	83 ec 04             	sub    $0x4,%esp
 627:	88 5d e2             	mov    %bl,-0x1e(%ebp)
 62a:	6a 01                	push   $0x1
 62c:	50                   	push   %eax
 62d:	ff 75 08             	pushl  0x8(%ebp)
 630:	e8 4d fe ff ff       	call   482 <write>
 635:	83 c4 10             	add    $0x10,%esp
 638:	83 c6 01             	add    $0x1,%esi
  for(i = 0; fmt[i]; i++){
 63b:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
 63f:	84 db                	test   %bl,%bl
 641:	74 77                	je     6ba <printf+0xca>
    if(state == 0){
 643:	85 ff                	test   %edi,%edi
    c = fmt[i] & 0xff;
 645:	0f be cb             	movsbl %bl,%ecx
 648:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
 64b:	74 cb                	je     618 <printf+0x28>
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 64d:	83 ff 25             	cmp    $0x25,%edi
 650:	75 e6                	jne    638 <printf+0x48>
      if(c == 'd'){
 652:	83 f8 64             	cmp    $0x64,%eax
 655:	0f 84 05 01 00 00    	je     760 <printf+0x170>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 65b:	81 e1 f7 00 00 00    	and    $0xf7,%ecx
 661:	83 f9 70             	cmp    $0x70,%ecx
 664:	74 72                	je     6d8 <printf+0xe8>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 666:	83 f8 73             	cmp    $0x73,%eax
 669:	0f 84 99 00 00 00    	je     708 <printf+0x118>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 66f:	83 f8 63             	cmp    $0x63,%eax
 672:	0f 84 08 01 00 00    	je     780 <printf+0x190>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 678:	83 f8 25             	cmp    $0x25,%eax
 67b:	0f 84 ef 00 00 00    	je     770 <printf+0x180>
  write(fd, &c, 1);
 681:	8d 45 e7             	lea    -0x19(%ebp),%eax
 684:	83 ec 04             	sub    $0x4,%esp
 687:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
 68b:	6a 01                	push   $0x1
 68d:	50                   	push   %eax
 68e:	ff 75 08             	pushl  0x8(%ebp)
 691:	e8 ec fd ff ff       	call   482 <write>
 696:	83 c4 0c             	add    $0xc,%esp
 699:	8d 45 e6             	lea    -0x1a(%ebp),%eax
 69c:	88 5d e6             	mov    %bl,-0x1a(%ebp)
 69f:	6a 01                	push   $0x1
 6a1:	50                   	push   %eax
 6a2:	ff 75 08             	pushl  0x8(%ebp)
 6a5:	83 c6 01             	add    $0x1,%esi
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 6a8:	31 ff                	xor    %edi,%edi
  write(fd, &c, 1);
 6aa:	e8 d3 fd ff ff       	call   482 <write>
  for(i = 0; fmt[i]; i++){
 6af:	0f b6 5e ff          	movzbl -0x1(%esi),%ebx
  write(fd, &c, 1);
 6b3:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
 6b6:	84 db                	test   %bl,%bl
 6b8:	75 89                	jne    643 <printf+0x53>
    }
  }
}
 6ba:	8d 65 f4             	lea    -0xc(%ebp),%esp
 6bd:	5b                   	pop    %ebx
 6be:	5e                   	pop    %esi
 6bf:	5f                   	pop    %edi
 6c0:	5d                   	pop    %ebp
 6c1:	c3                   	ret    
 6c2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        state = '%';
 6c8:	bf 25 00 00 00       	mov    $0x25,%edi
 6cd:	e9 66 ff ff ff       	jmp    638 <printf+0x48>
 6d2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
        printint(fd, *ap, 16, 0);
 6d8:	83 ec 0c             	sub    $0xc,%esp
 6db:	b9 10 00 00 00       	mov    $0x10,%ecx
 6e0:	6a 00                	push   $0x0
 6e2:	8b 7d d4             	mov    -0x2c(%ebp),%edi
 6e5:	8b 45 08             	mov    0x8(%ebp),%eax
 6e8:	8b 17                	mov    (%edi),%edx
 6ea:	e8 61 fe ff ff       	call   550 <printint>
        ap++;
 6ef:	89 f8                	mov    %edi,%eax
 6f1:	83 c4 10             	add    $0x10,%esp
      state = 0;
 6f4:	31 ff                	xor    %edi,%edi
        ap++;
 6f6:	83 c0 04             	add    $0x4,%eax
 6f9:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 6fc:	e9 37 ff ff ff       	jmp    638 <printf+0x48>
 701:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
        s = (char*)*ap;
 708:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 70b:	8b 08                	mov    (%eax),%ecx
        ap++;
 70d:	83 c0 04             	add    $0x4,%eax
 710:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        if(s == 0)
 713:	85 c9                	test   %ecx,%ecx
 715:	0f 84 8e 00 00 00    	je     7a9 <printf+0x1b9>
        while(*s != 0){
 71b:	0f b6 01             	movzbl (%ecx),%eax
      state = 0;
 71e:	31 ff                	xor    %edi,%edi
        s = (char*)*ap;
 720:	89 cb                	mov    %ecx,%ebx
        while(*s != 0){
 722:	84 c0                	test   %al,%al
 724:	0f 84 0e ff ff ff    	je     638 <printf+0x48>
 72a:	89 75 d0             	mov    %esi,-0x30(%ebp)
 72d:	89 de                	mov    %ebx,%esi
 72f:	8b 5d 08             	mov    0x8(%ebp),%ebx
 732:	8d 7d e3             	lea    -0x1d(%ebp),%edi
 735:	8d 76 00             	lea    0x0(%esi),%esi
  write(fd, &c, 1);
 738:	83 ec 04             	sub    $0x4,%esp
          s++;
 73b:	83 c6 01             	add    $0x1,%esi
 73e:	88 45 e3             	mov    %al,-0x1d(%ebp)
  write(fd, &c, 1);
 741:	6a 01                	push   $0x1
 743:	57                   	push   %edi
 744:	53                   	push   %ebx
 745:	e8 38 fd ff ff       	call   482 <write>
        while(*s != 0){
 74a:	0f b6 06             	movzbl (%esi),%eax
 74d:	83 c4 10             	add    $0x10,%esp
 750:	84 c0                	test   %al,%al
 752:	75 e4                	jne    738 <printf+0x148>
 754:	8b 75 d0             	mov    -0x30(%ebp),%esi
      state = 0;
 757:	31 ff                	xor    %edi,%edi
 759:	e9 da fe ff ff       	jmp    638 <printf+0x48>
 75e:	66 90                	xchg   %ax,%ax
        printint(fd, *ap, 10, 1);
 760:	83 ec 0c             	sub    $0xc,%esp
 763:	b9 0a 00 00 00       	mov    $0xa,%ecx
 768:	6a 01                	push   $0x1
 76a:	e9 73 ff ff ff       	jmp    6e2 <printf+0xf2>
 76f:	90                   	nop
  write(fd, &c, 1);
 770:	83 ec 04             	sub    $0x4,%esp
 773:	88 5d e5             	mov    %bl,-0x1b(%ebp)
 776:	8d 45 e5             	lea    -0x1b(%ebp),%eax
 779:	6a 01                	push   $0x1
 77b:	e9 21 ff ff ff       	jmp    6a1 <printf+0xb1>
        putc(fd, *ap);
 780:	8b 7d d4             	mov    -0x2c(%ebp),%edi
  write(fd, &c, 1);
 783:	83 ec 04             	sub    $0x4,%esp
        putc(fd, *ap);
 786:	8b 07                	mov    (%edi),%eax
  write(fd, &c, 1);
 788:	6a 01                	push   $0x1
        ap++;
 78a:	83 c7 04             	add    $0x4,%edi
        putc(fd, *ap);
 78d:	88 45 e4             	mov    %al,-0x1c(%ebp)
  write(fd, &c, 1);
 790:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 793:	50                   	push   %eax
 794:	ff 75 08             	pushl  0x8(%ebp)
 797:	e8 e6 fc ff ff       	call   482 <write>
        ap++;
 79c:	89 7d d4             	mov    %edi,-0x2c(%ebp)
 79f:	83 c4 10             	add    $0x10,%esp
      state = 0;
 7a2:	31 ff                	xor    %edi,%edi
 7a4:	e9 8f fe ff ff       	jmp    638 <printf+0x48>
          s = "(null)";
 7a9:	bb f4 09 00 00       	mov    $0x9f4,%ebx
        while(*s != 0){
 7ae:	b8 28 00 00 00       	mov    $0x28,%eax
 7b3:	e9 72 ff ff ff       	jmp    72a <printf+0x13a>
 7b8:	66 90                	xchg   %ax,%ax
 7ba:	66 90                	xchg   %ax,%ax
 7bc:	66 90                	xchg   %ax,%ax
 7be:	66 90                	xchg   %ax,%ax

000007c0 <free>:
 7c0:	55                   	push   %ebp
 7c1:	a1 d8 0c 00 00       	mov    0xcd8,%eax
 7c6:	89 e5                	mov    %esp,%ebp
 7c8:	57                   	push   %edi
 7c9:	56                   	push   %esi
 7ca:	53                   	push   %ebx
 7cb:	8b 5d 08             	mov    0x8(%ebp),%ebx
 7ce:	8d 4b f8             	lea    -0x8(%ebx),%ecx
 7d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 7d8:	39 c8                	cmp    %ecx,%eax
 7da:	8b 10                	mov    (%eax),%edx
 7dc:	73 32                	jae    810 <free+0x50>
 7de:	39 d1                	cmp    %edx,%ecx
 7e0:	72 04                	jb     7e6 <free+0x26>
 7e2:	39 d0                	cmp    %edx,%eax
 7e4:	72 32                	jb     818 <free+0x58>
 7e6:	8b 73 fc             	mov    -0x4(%ebx),%esi
 7e9:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
 7ec:	39 fa                	cmp    %edi,%edx
 7ee:	74 30                	je     820 <free+0x60>
 7f0:	89 53 f8             	mov    %edx,-0x8(%ebx)
 7f3:	8b 50 04             	mov    0x4(%eax),%edx
 7f6:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 7f9:	39 f1                	cmp    %esi,%ecx
 7fb:	74 3a                	je     837 <free+0x77>
 7fd:	89 08                	mov    %ecx,(%eax)
 7ff:	a3 d8 0c 00 00       	mov    %eax,0xcd8
 804:	5b                   	pop    %ebx
 805:	5e                   	pop    %esi
 806:	5f                   	pop    %edi
 807:	5d                   	pop    %ebp
 808:	c3                   	ret    
 809:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 810:	39 d0                	cmp    %edx,%eax
 812:	72 04                	jb     818 <free+0x58>
 814:	39 d1                	cmp    %edx,%ecx
 816:	72 ce                	jb     7e6 <free+0x26>
 818:	89 d0                	mov    %edx,%eax
 81a:	eb bc                	jmp    7d8 <free+0x18>
 81c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 820:	03 72 04             	add    0x4(%edx),%esi
 823:	89 73 fc             	mov    %esi,-0x4(%ebx)
 826:	8b 10                	mov    (%eax),%edx
 828:	8b 12                	mov    (%edx),%edx
 82a:	89 53 f8             	mov    %edx,-0x8(%ebx)
 82d:	8b 50 04             	mov    0x4(%eax),%edx
 830:	8d 34 d0             	lea    (%eax,%edx,8),%esi
 833:	39 f1                	cmp    %esi,%ecx
 835:	75 c6                	jne    7fd <free+0x3d>
 837:	03 53 fc             	add    -0x4(%ebx),%edx
 83a:	a3 d8 0c 00 00       	mov    %eax,0xcd8
 83f:	89 50 04             	mov    %edx,0x4(%eax)
 842:	8b 53 f8             	mov    -0x8(%ebx),%edx
 845:	89 10                	mov    %edx,(%eax)
 847:	5b                   	pop    %ebx
 848:	5e                   	pop    %esi
 849:	5f                   	pop    %edi
 84a:	5d                   	pop    %ebp
 84b:	c3                   	ret    
 84c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000850 <malloc>:
 850:	55                   	push   %ebp
 851:	89 e5                	mov    %esp,%ebp
 853:	57                   	push   %edi
 854:	56                   	push   %esi
 855:	53                   	push   %ebx
 856:	83 ec 0c             	sub    $0xc,%esp
 859:	8b 45 08             	mov    0x8(%ebp),%eax
 85c:	8b 15 d8 0c 00 00    	mov    0xcd8,%edx
 862:	8d 78 07             	lea    0x7(%eax),%edi
 865:	c1 ef 03             	shr    $0x3,%edi
 868:	83 c7 01             	add    $0x1,%edi
 86b:	85 d2                	test   %edx,%edx
 86d:	0f 84 9d 00 00 00    	je     910 <malloc+0xc0>
 873:	8b 02                	mov    (%edx),%eax
 875:	8b 48 04             	mov    0x4(%eax),%ecx
 878:	39 cf                	cmp    %ecx,%edi
 87a:	76 6c                	jbe    8e8 <malloc+0x98>
 87c:	81 ff 00 10 00 00    	cmp    $0x1000,%edi
 882:	bb 00 10 00 00       	mov    $0x1000,%ebx
 887:	0f 43 df             	cmovae %edi,%ebx
 88a:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
 891:	eb 0e                	jmp    8a1 <malloc+0x51>
 893:	90                   	nop
 894:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 898:	8b 02                	mov    (%edx),%eax
 89a:	8b 48 04             	mov    0x4(%eax),%ecx
 89d:	39 f9                	cmp    %edi,%ecx
 89f:	73 47                	jae    8e8 <malloc+0x98>
 8a1:	39 05 d8 0c 00 00    	cmp    %eax,0xcd8
 8a7:	89 c2                	mov    %eax,%edx
 8a9:	75 ed                	jne    898 <malloc+0x48>
 8ab:	83 ec 0c             	sub    $0xc,%esp
 8ae:	56                   	push   %esi
 8af:	e8 36 fc ff ff       	call   4ea <sbrk>
 8b4:	83 c4 10             	add    $0x10,%esp
 8b7:	83 f8 ff             	cmp    $0xffffffff,%eax
 8ba:	74 1c                	je     8d8 <malloc+0x88>
 8bc:	89 58 04             	mov    %ebx,0x4(%eax)
 8bf:	83 ec 0c             	sub    $0xc,%esp
 8c2:	83 c0 08             	add    $0x8,%eax
 8c5:	50                   	push   %eax
 8c6:	e8 f5 fe ff ff       	call   7c0 <free>
 8cb:	8b 15 d8 0c 00 00    	mov    0xcd8,%edx
 8d1:	83 c4 10             	add    $0x10,%esp
 8d4:	85 d2                	test   %edx,%edx
 8d6:	75 c0                	jne    898 <malloc+0x48>
 8d8:	8d 65 f4             	lea    -0xc(%ebp),%esp
 8db:	31 c0                	xor    %eax,%eax
 8dd:	5b                   	pop    %ebx
 8de:	5e                   	pop    %esi
 8df:	5f                   	pop    %edi
 8e0:	5d                   	pop    %ebp
 8e1:	c3                   	ret    
 8e2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 8e8:	39 cf                	cmp    %ecx,%edi
 8ea:	74 54                	je     940 <malloc+0xf0>
 8ec:	29 f9                	sub    %edi,%ecx
 8ee:	89 48 04             	mov    %ecx,0x4(%eax)
 8f1:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
 8f4:	89 78 04             	mov    %edi,0x4(%eax)
 8f7:	89 15 d8 0c 00 00    	mov    %edx,0xcd8
 8fd:	8d 65 f4             	lea    -0xc(%ebp),%esp
 900:	83 c0 08             	add    $0x8,%eax
 903:	5b                   	pop    %ebx
 904:	5e                   	pop    %esi
 905:	5f                   	pop    %edi
 906:	5d                   	pop    %ebp
 907:	c3                   	ret    
 908:	90                   	nop
 909:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 910:	c7 05 d8 0c 00 00 dc 	movl   $0xcdc,0xcd8
 917:	0c 00 00 
 91a:	c7 05 dc 0c 00 00 dc 	movl   $0xcdc,0xcdc
 921:	0c 00 00 
 924:	b8 dc 0c 00 00       	mov    $0xcdc,%eax
 929:	c7 05 e0 0c 00 00 00 	movl   $0x0,0xce0
 930:	00 00 00 
 933:	e9 44 ff ff ff       	jmp    87c <malloc+0x2c>
 938:	90                   	nop
 939:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 940:	8b 08                	mov    (%eax),%ecx
 942:	89 0a                	mov    %ecx,(%edx)
 944:	eb b1                	jmp    8f7 <malloc+0xa7>
