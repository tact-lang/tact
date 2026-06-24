struct OneSub1 { val: Int; }
struct OneSub2 { one: OneSub1; two: Int; three: Bool; }
struct OneSub3 { next: OneSub2; extra: String; flag: Bool; }

contract MixedDeepWide {
    data: OneSub3;

    init() {
        self.data = OneSub3{
            next: OneSub2{
                one: OneSub1{ val:42 },
                two:99,
                three:false
            },
            extra: "foo",
            flag: true
        };
    }
}
