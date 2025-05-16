struct Deep {
    i: Int;
    flag: Bool;
    text: String;
    optInt: Int?;
}

struct Middle {
    val: Int;
    deep: Deep;
    descr: String;
    optBool: Bool?;
}

struct Top {
    m1: Middle;
    m2: Middle;
    label: String;
    switch: Bool;
}

contract MultiNestedContract {
    state: Top;

    init() {
        self.state = Top{
            m1: Middle{
                val: 1,
                deep: Deep{
                    i: 10,
                    flag: true,
                    text: "deep1",
                    optInt: null
                },
                descr: "mid1",
                optBool: false
            },
            m2: Middle{
                val: 2,
                deep: Deep{
                    i: 20,
                    flag: false,
                    text: "deep2",
                    optInt: 100
                },
                descr: "mid2",
                optBool: null
            },
            label: "top",
            switch: true
        };
    }
}