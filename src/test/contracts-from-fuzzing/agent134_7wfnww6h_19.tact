struct Combo {
    x: Int;
    y: Int?;          // implicit null
    z: Int? = null;   // explicit null
    s: String = "hi"; // explicit
}

contract MixedDefaults {
    data: Combo = Combo{ x: 7, s: "hello" };
}