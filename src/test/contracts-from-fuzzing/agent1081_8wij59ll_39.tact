struct Compose {
    a: Int;
    b: Bool;
    c: String;
}

contract AssignParts {
    val: Compose;

    init() {
        let partial = Compose{a:5,b:true,c:"x"};
        self.val = partial;
    }
}