// Struct with long string default values
struct LongDefaults {
    s1: String = "111111111111111111111111111111";
    s2: String = "222222222222222222222222222222";
    s3: String = "333333333333333333333333333333";
}

contract TestContract {
    data: LongDefaults;
    
    init() {
        self.data = LongDefaults{};
    }
}