struct LongList {
    a: Int; b:Int; c:Int; d:Int; e:Int;
    f:Int; g:Int; h:Int; i:Int; j:Int;
    k:Int; l:Int; m:Int; n:Int; o:Int;
    p:Int; q:Int; r:Int; s:Int; t:Int;
    u:Int; v:Int; w:Int; x:Int; y:Int;
    z:Int;
}

contract LongFields {
    data: LongList;

    init() {
        self.data = LongList{
            a:0, b:0, c:0, d:0, e:0,
            f:0, g:0, h:0, i:0, j:0,
            k:0, l:0, m:0, n:0, o:0,
            p:0, q:0, r:0, s:0, t:0,
            u:0, v:0, w:0, x:0, y:0,
            z:0
        };
    }
}
