struct Inner1 { x: Int; opt: Bool?; }
struct Inner2 { y: Inner1; flag: Bool; }
struct Inner3 { z: Inner2; s: String; }

contract MultiLevelStruct {
    val: Inner3;

    init() {
        self.val = Inner3{
            z: Inner2 {
                y: Inner1 { x: 99, opt: null },
                flag: true
            },
            s: "hello"
        };
    }

    receive() {
        let x = self.val.z.y.x;
        let opt = self.val.z.y.opt;
        let s = self.val.s;
    }
}
