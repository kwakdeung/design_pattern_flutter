// 싱글톤 패턴: 클래스의 인스턴스는 오직 하나임을 보장하며 이 인스턴스에 접근할 수 있는 방법을 제공하는 패턴
// - 유일하게 존재하는 인스턴스로의 접근을 통제할 수 있다.
// - 전역 변수를 사용함으로써 발생할 수 있는 오류를 줄일 수 있다.(C++ 경우)

void main() {
  ConnectionPool instance1 = ConnectionPool.getInstance();
  ConnectionPool instance2 = ConnectionPool.getInstance();

  print(instance1);
  print(instance2);
  print(instance1 == instance2);
}

class ConnectionPool {
  // 정적 변수로 하나만
  static ConnectionPool _instance = ConnectionPool();
  // 생성자, 외부에서 Connectionpool을 계속 생성할 수 없게 하기
  _ConnectionPool() {}

  // 클래스를 생성하지 않아도 호출할 수 있도록 하는 static
  static ConnectionPool getInstance() {
    if (_instance == null) {
      _instance = ConnectionPool();
    }
    return _instance;
  }
}
