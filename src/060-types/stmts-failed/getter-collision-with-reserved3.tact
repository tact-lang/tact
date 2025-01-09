primitive String;

trait BaseTrait { }

contract TestContract {
    get fun getter1() {
        return;
    }

    get fun supported_interfaces(): String{
        return "ok";
    }
}
