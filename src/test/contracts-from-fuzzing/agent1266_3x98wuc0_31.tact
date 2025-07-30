struct HasConstant {
    foo: Int;
}

contract ConstInits {
    const BAR: Int = 10;
    data: HasConstant;
    init() {
        self.data = HasConstant{
            foo: self.BAR
        };
    }
}