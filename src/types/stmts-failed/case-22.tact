primitive Int;
primitive Bool;

trait BaseTrait {
    
}

struct A {
    a: Int;
    b: Int;
}

contract Contract {
    value: Int;
    init(arg: Bool) {
        self.update();
        self.value = 1;
    }

    fun update() {
        self.value = self.value + 1;
    }
}