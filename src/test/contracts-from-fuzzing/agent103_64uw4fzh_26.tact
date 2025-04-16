struct LargeStrings {
    a: String;
    b: String;
    c: String;
    d: String;
    e: String;
}

contract TestContract {
    data: LargeStrings;

    init() {
        self.data = LargeStrings{
            a:"A",b:"B",c:"C",d:"D",e:"E"
        };
    }
}
