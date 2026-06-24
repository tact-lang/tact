struct SomeStruct { x: Int; y: Bool; str: String; }

contract Test1 {
    a: SomeStruct;
    b: SomeStruct?;

    init() {
        self.a = SomeStruct{ x:1, y:true, str:"hi" };
        self.b = null;
    }
    receive() {}
}