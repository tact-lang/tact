struct OneField { x: Int; }

contract DefaultsTest {
    a: OneField = OneField{x:1};
    b: OneField? = null;
}