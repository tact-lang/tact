const string1: String = "string 1";
const string2: String = "string 2";
const string3: String = "string 3";

struct MyStruct {
    s: String;
}

struct MyNestedStruct {
    struct: MyStruct;
}

contract ConstStringReceiverTester {
    const string4: String = "string 4";
    const struct: MyStruct = MyStruct {
        s: "string 5"
    };
    const nestedStruct: MyNestedStruct = MyNestedStruct {
        struct: MyStruct {
            s: "string 6"
        }
    };

    receive() { }

    receive("string 1") {
        self.reply("string 1".asComment());
    }

    receive(string2) {
        self.reply(string2.asComment());
    }

    receive(string3) {
        self.reply(string3.asComment());
    }

    receive(self.string4) {
        self.reply(self.string4.asComment());
    }

    receive(self.struct.s) {
        self.reply("string 5".asComment()); // until const struct fields are fixed
    }

    receive(self.nestedStruct.struct.s) {
        self.reply("string 6".asComment()); // until const struct fields are fixed
    }
}