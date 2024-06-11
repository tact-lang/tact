const string1: String = "string 1";
const string2: String = "string 2";
const string3: String = "string 3";

contract ConstStringReceiverTester {
    const string4: String = "string 4";

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
}