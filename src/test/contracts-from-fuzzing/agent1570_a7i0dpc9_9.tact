struct LongStringFields {
    a: String;
    b: String;
    c: String;
    d: String;
    e: String;
    f: String;
}

contract TestContract {
    data: LongStringFields;
    init() {
        self.data = LongStringFields{
            a:"a", b:"b", c:"c", d:"d", e:"e", f:"f"
        };
    }
}