// Test optional struct field with explicit null init assignment

struct Info { name: String; age: Int?; }

contract NullInit {
    info: Info? = null;

    receive() {}
}