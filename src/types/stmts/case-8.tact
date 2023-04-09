primitive Int;
primitive Bool;

trait BaseTrait {
    
}

contract Contract {
    value: Int;
    init(arg: Bool) {
        if (arg) {
            self.value = 1;
        } else if (!arg) {
            self.value = 2;
        } else {
            self.value = 3;
        }
    }
}

struct S {
    a: Int;
    b: Int;
}

contract Contract2 {
    value: Int;
    value2: S;
    init(arg: Bool) {
        self.value = 1;
        self.value2 = S{ a: 1, b: self.value };
    }
}

contract Contract3 {
    value: Int;
    init(arg: Bool) {
        self.value = 1;
        self.update();
    }

    fun update() {
        self.value = self.value + 1;
    }
}