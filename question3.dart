class BankAccount {
  final String accountNumber;
  final String accountHolder;
  final String accountType; 
  double balance;

  BankAccount(this.accountNumber, this.accountHolder, this.accountType)
      : balance = 0.0; 

  void deposit(double amount) {
    if (amount > 0) {
      balance += amount;
    } else {
      print('Deposit amount must be positive.');
    }
  }

  bool withdraw(double amount) {
    if (amount <= 0) {
      print('Withdrawal amount must be positive.');
      return false;
    }

    if (balance >= amount) {
      balance -= amount;
      return true;
    } else {
      print('Insufficient funds for withdrawal of ${amount.toStringAsFixed(2)} from account $accountNumber');
      return false;
    }
  }

  double getBalance() {
    return balance;
  }

  void displayAccountInfo() {
    print(
        'Account: $accountNumber, Holder: $accountHolder, Type: $accountType, Balance: ${balance.toStringAsFixed(2)}');
  }
}

void main() {
  
  BankAccount accountAlice = BankAccount('12345', 'Alice', 'Savings');
  BankAccount accountBob = BankAccount('67890', 'Bob', 'Checking');
  BankAccount accountCharlie = BankAccount('11223', 'Charlie', 'Savings');

  accountAlice.deposit(2000.0); 
  accountBob.deposit(1500.0); 
  accountCharlie.deposit(500.0); 

  accountAlice.withdraw(500.0); 
  accountBob.withdraw(700.0); 

  accountBob.withdraw(1000.0); 

  print('\n--- Final Account Summary (Matching Expected Output) ---');
  
  accountAlice.displayAccountInfo(); 
  
  accountBob.displayAccountInfo();
  
  accountBob.withdraw(1000.0);
}