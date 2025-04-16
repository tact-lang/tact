// attempting nested optional primitive which is forbidden (known) would be invalid, so test optional struct with optional internal fields
struct SubNestedOpt {
    value: Int?;
}

struct OuterStructOpt {
    sub: SubNestedOpt?;
}

contract CheckOptInStruct {
    st: OuterStructOpt;

    init() {
        self.st = OuterStructOpt{ sub: null };
    }
}