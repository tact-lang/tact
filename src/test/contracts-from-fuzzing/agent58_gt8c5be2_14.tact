struct Person { name: String; age: Int? }

contract TestDestructuringOptional {
    receive() {
         // Correct destructuring assignment using comma as field separator in instantiation
         let Person { name, age } = Person { name: "Alice", age: 30 };
         // If age is not null, add 10 to it; otherwise, return 0
         let computed: Int = (age != null) ? (age!! + 10) : 0;
    }
}
