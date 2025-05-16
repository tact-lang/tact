struct DeepNestedDefaults {
    s1: Int = 1;
    s2: Inner1;
}

struct Inner1 {
    s3: Int = 3;
    s4: Inner2;
}

struct Inner2 {
    s5: Int = 5;
    s6: Bool?;
}

contract DefaultsTest {
    val: DeepNestedDefaults;

    init() {
        self.val = DeepNestedDefaults{
            s2: Inner1{
                s4: Inner2{
                    s6: true
                }
            }
        };
    }
}