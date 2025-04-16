struct OneFieldOptional { val: Int?; }

contract OptionalStructField {
    s: OneFieldOptional = OneFieldOptional{ val: null };

    init() {
        self.s = OneFieldOptional{ val: null };
    }
}