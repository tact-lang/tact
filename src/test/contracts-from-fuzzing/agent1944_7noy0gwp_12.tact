struct MultiOptionals {
    a: Int?;
    b: Bool?;
    s: String?;
}

contract StructManyOptionals {
    val: MultiOptionals;

    init() {
        self.val = MultiOptionals{a:null,b:null,s:null};
    }
}