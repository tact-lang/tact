/*
  Fuzz Test: Tact Structs and Messages (Revised - renamed Address to MyAddress)
  ------------------------------------------------------------
  This snippet tests various aspects of structs and messages in Tact. It covers:

  1. Valid struct initialization and field access
  2. Nested structs (struct inside a struct)
  3. Destructuring structs using field punning
  4. Structs with a field that is a map
  5. Using a struct as a function parameter and returning a struct
  6. Nested destructuring performed in multiple steps to avoid complex syntax issues
*/

struct Person {
    name: String;
    age: Int;
}

fun testStructInitialization() {
    // Create a Person struct with valid initialization
    let p = Person { name: "Alice", age: 30 };
    dump(p.name); // Expected: "Alice"
    dump(p.age);  // Expected: 30
}

struct MyAddress {
    city: String;
    zip: Int;
}

struct Employee {
    person: Person;
    address: MyAddress;
}

fun testNestedStructs() {
    let p = Person { name: "Bob", age: 40 };
    let addr = MyAddress { city: "Metropolis", zip: 12345 };
    let e = Employee { person: p, address: addr };
    dump(e.person.name);  // Expected: "Bob"
    dump(e.address.zip);  // Expected: 12345
}

fun testStructDestructuring() {
    let p = Person { name: "Carol", age: 25 };
    // Field punning: using the shorthand for structs
    let Person { name, age } = p;
    dump(name); // Expected: "Carol"
    dump(age);  // Expected: 25

    // Using underscore to discard a field
    let Person { name: n, age: _ } = p;
    dump(n); // Expected: "Carol"
}

struct DataHolder {
    data: map<Int, Int>;
}

fun testStructWithMap() {
    let m: map<Int, Int> = emptyMap();
    m.set(1, 100);
    let d = DataHolder { data: m };
    dump(d.data.get(1)!!); // Expected: 100
}

fun updateAge(p: Person, increment: Int) : Person {
    // Create a new Person with updated age
    return Person { name: p.name, age: p.age + increment };
}

fun testStructParameter() {
    let p = Person { name: "Eve", age: 22 };
    let p2 = updateAge(p, 3);
    dump(p2.age); // Expected: 25
}

fun testNestedDestructuring() {
    // Create an Employee with nested structs
    let e = Employee { 
        person: Person { name: "Frank", age: 35 }, 
        address: MyAddress { city: "Gotham", zip: 54321 } 
    };
    // First, destructure the outer Employee
    let Employee { person, address } = e;
    // Then destructure the nested structs individually
    let Person { name, age } = person;
    let MyAddress { city, zip } = address;
    dump(name); // Expected: "Frank"
    dump(city); // Expected: "Gotham"
}

fun main() {
    testStructInitialization();
    testNestedStructs();
    testStructDestructuring();
    testStructWithMap();
    testStructParameter();
    testNestedDestructuring();
    dump("Structs and Messages fuzz testing cycle completed successfully.");
    return;
}
