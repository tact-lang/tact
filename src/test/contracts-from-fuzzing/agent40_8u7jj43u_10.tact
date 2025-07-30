struct NestedStrings {
    s1: String;
    s2: String;
    s3: String;
}

struct MultiNestedString {
    layer1: NestedStrings;
    layer2: NestedStrings;
    layer3: NestedStrings;
}

contract TestNestedStrings {
    data: MultiNestedString;

    init() {
        self.data = MultiNestedString{
            layer1: NestedStrings{s1:"a", s2:"b", s3:"c"},
            layer2: NestedStrings{s1:"d", s2:"e", s3:"f"},
            layer3: NestedStrings{s1:"g", s2:"h", s3:"i"}
        };
    }

    receive() {
        let tmp = self.data;
    }
}