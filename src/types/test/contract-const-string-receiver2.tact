primitive Int;
primitive String;

const string2: String = "string 2";

trait BaseTrait {
    
}

contract Main {
    receive("string 1") {

    }

    receive(string2) {

    }
}