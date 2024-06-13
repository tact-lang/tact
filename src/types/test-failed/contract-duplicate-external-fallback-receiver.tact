primitive Int;

trait BaseTrait {
    
}

message A {
    a: Int as uint32;
}

contract Test {
    external(msg: A) {
        42;
    }

    external() {
        42;
    }

    external() {

    }
}