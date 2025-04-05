struct Pair {
    first: Int;
    second: Int;
}

struct ComplexStruct {
    normal: Int;
    optionalField: Int?;
    pair: Pair;
}

contract TestContract {
    receive() {
        let cs1 = ComplexStruct {
            normal: 100,
            optionalField: 200, // optional field provided
            pair: Pair { first: 1, second: 2 }
        };

        let cs2 = ComplexStruct {
            normal: 300,
            optionalField: null, // optional field is null by default
            pair: Pair { first: 3, second: 4 }
        };

        // Access optional field with non-null assertion for cs1
        let sum1 = cs1.optionalField!! + cs1.normal;

        // Check for null before accessing for cs2
        if (cs2.optionalField != null) {
            let sum2 = cs2.optionalField!! + cs2.normal;
        }

        let pairSum = cs1.pair.first + cs1.pair.second;
    }
}
