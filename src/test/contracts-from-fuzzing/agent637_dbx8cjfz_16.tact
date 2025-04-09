// default nested optional bools
struct Dummy {
  flag: Bool?;
  deep: Nested?;
}

struct Nested {
  another: Bool?;
}

contract TestContract {
    d: Dummy;

    init() {
        self.d = Dummy{
            flag: null,
            deep: Nested{
                another: null
            }
        };
    }
}