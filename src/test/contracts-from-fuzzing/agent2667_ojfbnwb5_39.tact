struct BoolIntPrimitives {
    a: Bool;
    b: Int;
}

contract BoolIntPrimitivesContract {
    data: BoolIntPrimitives;

    init() {
        self.data = BoolIntPrimitives{a:true,b:42};
    }

    receive() {
        self.data = BoolIntPrimitives{a:false,b:43};
    }
}