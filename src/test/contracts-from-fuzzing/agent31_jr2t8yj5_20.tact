struct ManyBool {
    a: Bool; b: Bool; c: Bool; d: Bool; e: Bool; f: Bool; g: Bool; h: Bool;
    i: Bool; j: Bool; k: Bool; l: Bool; m: Bool; n: Bool; o: Bool; p: Bool;
}

contract Test {
    val: ManyBool;
    init() {
        self.val = ManyBool{
            a:true,b:true,c:true,d:true,e:true,f:true,g:true,h:true,
            i:true,j:true,k:true,l:true,m:true,n:true,o:true,p:true
        };
    }
}
