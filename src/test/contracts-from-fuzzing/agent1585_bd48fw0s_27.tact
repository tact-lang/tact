struct OnlyOpt {
    a: Int?;
    b: Int?;
    c: Int?;
}

contract AllNullInit {
    val: OnlyOpt;

    init() {
        self.val = OnlyOpt{
            a:null,b:null,c:null
        };
    }
}