primitive Int;
primitive String;

trait BaseTrait {
    
}

struct MyStruct {
    s: String;
}

contract Main {
    const struct: MyStruct = MyStruct {
        s: "string 1"
    };

    receive("string 1") {

    }

    receive(self.struct2.s) {

    }
}