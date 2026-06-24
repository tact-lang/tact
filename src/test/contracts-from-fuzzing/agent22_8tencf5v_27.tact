// Nested optional composite, then assign partial fill at init
struct Deep {
    first: Int?;
    second: Bool?;
    text: String?;
}

contract PartialInit {
    data: Deep;

    init() {
        self.data = Deep{
            first: 42,
            second: null,
            text: null
        };
    }
}