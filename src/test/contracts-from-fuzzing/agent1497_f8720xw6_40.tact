// optional nested struct with some defaults
struct Vehicle {
    wheels: Int = 4;
    motorized: Bool = true;
}

struct Garage {
    car: Vehicle?;
    name: String;
}

contract TestContract {
    g: Garage = Garage{ car: null, name: "MyGarage" };
}