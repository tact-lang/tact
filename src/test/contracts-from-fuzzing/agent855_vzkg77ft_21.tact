struct LV4 { val: Int; }
struct LV3 { child: LV4; flag: Bool; }
struct LV2 { mid: LV3; name: String; }
struct LV1 { top: LV2?; count: Int; }

contract FourDeep {
    root: LV1;

    init() {
        self.root = LV1{
            top: LV2{
                mid: LV3{
                    child: LV4{ val: 777 },
                    flag: true,
                },
                name: "deep",
            },
            count: 1,
        };
    }

    receive() {}
}