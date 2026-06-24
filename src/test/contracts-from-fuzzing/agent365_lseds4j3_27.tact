struct HasString {
    str: String;
}

struct HasOptionalString {
    str: String?;
}

contract CompareStringOptional {
    h1: HasString;
    h2: HasOptionalString;

    init() {
        self.h1 = HasString{ str: "hi" };
        self.h2 = HasOptionalString{ str: null };
    }
}