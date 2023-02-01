import "./native.fc";

@name(hello_world)
native helloWorld(): Int;

contract Native {
    
    value: Int;

    init() {
        self.value = 0;
    }

    receive("Increment") {
        self.value = self.value + helloWorld();
    }
}