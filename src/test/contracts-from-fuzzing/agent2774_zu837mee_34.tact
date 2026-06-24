// struct with many string fields
struct Words {
    a: String;
    b: String;
    c: String;
    d: String;
    e: String;
    f: String;
}

contract TestContract {
    val: Words;

    init() {
        self.val = Words{
            a:"a",
            b:"b",
            c:"c",
            d:"d",
            e:"e",
            f:"f"
        };
    }
}