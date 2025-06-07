struct DeepLevel4 { val: Int; }
struct DeepLevel3 { next: DeepLevel4; flag: Bool; }
struct DeepLevel2 { next: DeepLevel3; count: Int; }
struct DeepLevel1 { next: DeepLevel2; state: Bool; }

contract TestContract {
    data: DeepLevel1;

    init() {
        self.data = DeepLevel1{
            next: DeepLevel2{
                next: DeepLevel3{
                    next: DeepLevel4{ val: 1 },
                    flag: true
                },
                count: 42
            },
            state: false
        };
    }
}