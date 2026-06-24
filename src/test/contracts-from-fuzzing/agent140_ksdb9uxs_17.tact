struct Stuff {
    a: Int;
    b: Bool;
    c: String;
}

contract OptionalStructNullable {
    x: Stuff?;

    init() {
        self.x = Stuff{ a:1, b:true, c:"str" };
    }
}