struct Massive {
    a: Int; b: Int; c: Int; d: Int; e: Int;
    f: Int; g: Int; h: Int; i: Int; j: Int;
    k: Int; l: Int; m: Int; n: Int; o: Int;
    p: Int; q: Int; r: Int; s: Int; t: Int;
}

contract HugeStructTest {
    big: Massive = Massive{
        a:1, b:2, c:3, d:4, e:5,
        f:6, g:7, h:8, i:9, j:10,
        k:11, l:12, m:13, n:14, o:15,
        p:16, q:17, r:18, s:19, t:20
    };

    receive() {
        self.big = Massive{
            a:10, b:20, c:30, d:40, e:50,
            f:60, g:70, h:80, i:90, j:100,
            k:110, l:120, m:130, n:140, o:150,
            p:160, q:170, r:180, s:190, t:200
        };
    }
}