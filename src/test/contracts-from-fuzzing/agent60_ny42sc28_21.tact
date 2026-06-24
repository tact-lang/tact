struct MaybePair {
    a: Int?;
    b: Int?;
}

contract OptionalTest {
    // Function that sums non-null values, defaulting nulls to 0
    fun sumWithDefault(pair: MaybePair): Int {
         let a: Int = pair.a != null ? pair.a!! : 0;
         let b: Int = pair.b != null ? pair.b!! : 0;
         return a + b;
    }

    // Getter that creates a MaybePair with one field null and returns the sum
    get fun getSumDefault(): Int {
         let pair: MaybePair = MaybePair { a: null, b: 25 };
         return self.sumWithDefault(pair);
    }

    // Function that forcefully sums non-optional values using non-null assertion
    fun sumNonNull(pair: MaybePair): Int {
         // Will throw at runtime if any field is null
         let a: Int = pair.a!!;
         let b: Int = pair.b!!;
         return a + b;
    }

    // Getter that uses sumNonNull on a fully defined pair
    get fun getSumNonNull(): Int {
         let pair: MaybePair = MaybePair { a: 10, b: 20 };
         return self.sumNonNull(pair);
    }
}
