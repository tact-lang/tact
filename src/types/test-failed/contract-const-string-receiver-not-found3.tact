primitive Int;
primitive String;

trait BaseTrait {
    
}

struct MyStruct {
    s: String;
}

contract Main {
    struct: MyStruct;

    init () {
        self.struct = MyStruct {
            s: "string 1"
        };
    }

    receive("string 1") {

    }

    receive(self.struct.s) {

    }
}