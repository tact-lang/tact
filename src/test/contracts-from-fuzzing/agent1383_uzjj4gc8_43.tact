struct S {
    x:Int?;
}

contract NestedNullInit {
    s:S; 
    init() {
        self.s = S{ x:null };
    }
}