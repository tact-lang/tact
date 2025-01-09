primitive String;

trait BaseTrait { }

contract TestContract {
    get fun getter1() {
        return;
    }

    get(113617) fun _supported_interfaces(): String{
        return "ok";
    }
}
