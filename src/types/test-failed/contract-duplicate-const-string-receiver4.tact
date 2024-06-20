primitive Int;
primitive String;

trait BaseTrait {
    
}

contract Main {
    const string1: String = "string 1";

    receive("string 1") {

    }

    receive(self.string1) {

    }
}