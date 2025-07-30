struct InnerMost { val: String; flag: Bool; }

struct Mid { maybe: InnerMost?; count: Int; }

contract WrapOptional {
    data: Mid = Mid{ maybe: null, count: 5 };
}