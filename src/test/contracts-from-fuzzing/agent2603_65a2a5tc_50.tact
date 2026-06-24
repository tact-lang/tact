struct S {
    x: Int;
    y: Bool;
    z: String;
}

contract AccessTest {
    val: S;
    init() {
        self.val = S{x:5,y:true,z:"f"};
    }
}
