struct ABC {
    a: Bool;
    b: Int;
    c: Bool;
}

contract DefaultsOverride {
    x: ABC = ABC{ a:true, b:42, c:false };

    init() {
        self.x = ABC{ a:false, b:-1, c:true };
    }
}