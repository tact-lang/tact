struct Deep {
    value: Int;
}

struct Middle {
    deep: Deep?;
}

struct Outer {
    middle: Middle?;
}

contract TestDeepOptionals {
    receive() {
        // Construct deeply nested optionals by directly assigning non-null values
        let opt: Outer = Outer{
            middle: Middle{
                deep: Deep{ value: 999 }
            }
        };
    }
}
