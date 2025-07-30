struct Big {
    a:Int; b:Int; c:Int; d:Int; e:Int; f:Int; g:Int; h:Int; i:Int; j:Int;
    k:Int; l:Int; m:Int; n:Int; o:Int; p:Int; q:Int; r:Int; s:Int; t:Int;
}

contract BugCase {
    value: Big?;

    init() {
        self.value = null;
    }
}