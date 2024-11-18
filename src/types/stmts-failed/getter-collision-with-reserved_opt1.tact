primitive String;

trait BaseTrait { }

contract TestContract {
    get fun getter1() {
        return;
    }

    get(115390) fun _lazy_deployment_completed(): String{
        return "not ok";
    }
}
