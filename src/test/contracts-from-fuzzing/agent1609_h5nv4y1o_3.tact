struct Deep1 { fieldA: Int; fieldB: Bool; }
struct Deep2 { inner: Deep1; number: Int; }
struct Deep3 { inner: Deep2; text: String; flag: Bool; }

contract TestContract {
    deep: Deep3;

    init() {
        self.deep = Deep3{
            inner: Deep2{
                inner: Deep1{
                    fieldA: 5,
                    fieldB: false
                },
                number: 10
            },
            text: "abc",
            flag: true
        };
    }

    receive() {
        self.deep = Deep3{
            inner: Deep2{
                inner: Deep1{
                    fieldA: 6,
                    fieldB: true
                },
                number: 11
            },
            text: "def",
            flag: false
        };
    }
}