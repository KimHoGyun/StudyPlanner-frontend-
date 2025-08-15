class ApiConfig {
  static String get baseUrl {
    // 웹 환경에서는 배포된 백엔드 URL 사용
    if (kIsWeb) {
      return 'https://your-backend-url.com'; // 실제 백엔드 배포 URL
    }
    // 개발 환경
    return 'http://localhost:8080';
  }
}