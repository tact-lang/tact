struct ContainsString {
    val1: String;
    val2: String?;
}

struct ContainsBool {
    flag1: Bool;
    flag2: Bool?;
}

struct Mixed {
    part1: ContainsString;
    part2: ContainsBool;
    comment: String?;
}

contract CombinedStorage {
    big: Mixed;

    init() {
        self.big = Mixed{
            part1: ContainsString{ val1: "abc", val2: null },
            part2: ContainsBool { flag1: true, flag2: false },
            comment: "zzz"
        };
    }
}