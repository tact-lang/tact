struct Second {
    text: String;
    num: Int;
}

struct First {
    optSec: Second?;
}

contract OptionalStructField {
    data: First;

    init() {
        self.data = First{
            optSec: null,
        };
    }
}