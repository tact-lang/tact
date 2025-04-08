struct Deep2 { x: Int; y: Bool; }

struct Deep1 { d: Deep2; str: String; }

struct Deep0 { inner: Deep1; b: Bool; }

contract DeepNestContract {
    complex: Deep0;

    init() {
        self.complex = Deep0{
            inner: Deep1{
                d: Deep2{
                    x: 42,
                    y: false
                },
                str: "nested"
            },
            b: true
        };
    }
}
